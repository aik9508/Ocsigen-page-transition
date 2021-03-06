[%%shared
  open Eliom_content
  open Html.D
]

[%%client 
  open Dom_html
  open Html
  let (>>=) = Lwt.bind
]

let main_service =
  Eliom_service.create
    ~path:(Eliom_service.Path ["demo-msp"])
    ~meth:(Eliom_service.Get Eliom_parameter.unit)
    ()

let page1_service =
  Eliom_service.create
    ~path:(Eliom_service.Path ["page1"])
    ~meth:(Eliom_service.Get Eliom_parameter.unit)
    ()

let page2_service =
  Eliom_service.create
    ~path:(Eliom_service.Path ["page2"])
    ~meth:(Eliom_service.Post 
             (Eliom_parameter.unit,
              Eliom_parameter.string "message"))
    ()

let%client page2_service = ~%page2_service
let%client page1_service = ~%page1_service
let%client main_service = ~%main_service

let%shared other_head =
  [ meta 
      ~a:[a_name "viewport";
          a_content "width=device-width, initial-scale=1, user-scalable=no"] 
      ();]

[%%client 

  let img_list = [|
    "https://img.besport.com/384/k_HkJWZZRutcVyuVdX2wsTAK8ZI";
    "https://img.besport.com/384/Jixqg0QBArYKC01gjgAHfbHIHWA";
    "https://img.besport.com/384/F8Kgl3Ls60IFfUi4sKRLlP4EEig";
    "https://img.besport.com/512/YBy2xKJAQp0XUF-um0EZN2Jmhpk";
    "https://img.besport.com/384/Iln_umwe8ANwYz0aPZfZpDKUDdE";
    "https://img.besport.com/384/lYLhFjgR3etluPDbMchzJ2k5z_U";
    "https://img.besport.com/1536/ic0VRTYZMlugZulsk_GTfhcsqDA";
    "https://img.besport.com/768/PeGRdgFPGsSW5bZyHXGRqKFy9IM";
    "https://img.besport.com/384/mDO75wbMLEGuvC80Lz2UMGTItjk";
    "https://img.besport.com/384/mF7rHdkKmHI0U6NWv3DGtExMTyU"
  |]

  let news_pieces id : 
    Html_types.div Eliom_content.Html.D.elt Lwt.t=
    let news_container = 
      D.(div ~a:[a_class ["mp-news-content"]] [
        div ~a:[a_class ["mp-news-title"]] [
          pcdata "Golden State remporte le titre face a Cleveland";
          D.(a ~service:page1_service [pcdata "Voir Plus"] ())
        ] 
      ]) in
    Manip.SetCss.backgroundImage 
      news_container 
      ("url("^img_list.(id)^")");
    Lwt.return news_container

  let get_one_element_by_className class_name =
    Js.Opt.get ((document##getElementsByClassName (Js.string class_name))##item 0)
      (fun () -> assert false)

  let main_service_onload_handler () = 
    let head_bcg = get_one_element_by_className "mp-head" in
    let span_discover = get_one_element_by_className "mp-head-title-discover" in
    let news_container = get_one_element_by_className "mp-news-container" in
    let button = get_one_element_by_className "mp-button" in
    let head_width =head_bcg##.offsetWidth in
    let span_discover_width = span_discover##.offsetWidth in
    span_discover##.style##.transform := 
      Js.string ("translateX(" 
                 ^ string_of_int ((head_width-span_discover_width)/2)
                 ^ "px)");
    span_discover##.classList##remove (Js.string "mp-faded");
    ignore 
      (Lwt_js_events.clicks button
         (fun _ _ -> 
            let news_container = Html.Of_dom.of_element news_container in
            let%lwt elt = news_pieces 5 in
            Html.Manip.appendChild news_container elt ;
            Lwt.return_unit )) ;
    Lwt.async (
      fun () ->
        begin
          if news_container##.innerHTML = Js.string "" 
          then
            let news_container = Html.Of_dom.of_element news_container in
            for i = 0 to 9 do
              Lwt.async( fun () ->
                (news_pieces i) >>=
                (fun elt ->
                   Html.Manip.appendChild news_container elt;
                   Lwt.return_unit))
            done
        end;
        Lwt.return_unit)

  let page1_service_onload_handler () =
    let head_bcg = get_one_element_by_className "mp-head" in
    let span_moment = get_one_element_by_className "mp-head-title-moment" in
    let span_chevron = get_one_element_by_className "mp-head-chevron" in
    let head_width =head_bcg##.offsetWidth in
    let span_moment_width = span_moment##.offsetWidth in
    span_moment##.style##.transform := 
      Js.string ("translateX(" 
                 ^ string_of_int ((head_width-span_moment_width)/2)
                 ^ "px)");
    span_moment##.classList##remove (Js.string "mp-faded");
    ignore 
      (Lwt_js_events.clicks span_chevron
         (fun _ _ -> Dom_html.window##.history##back ; Lwt.return_unit)) 

  let page2_service_onload_handler () =
    let div_back = get_one_element_by_className "mp-go-back" in
    ignore 
      (Lwt_js_events.clicks div_back
         (fun _ _ -> Dom_html.window##.history##back ; Lwt.return_unit)) 

  let create_screenshot_ref () = ref None
  let screenshot_list = ref []

  let pop_screenshot id =
    let screenshot = List.assq id !screenshot_list in
    screenshot_list := 
      List.filter (fun (id', _) -> id <> id') !screenshot_list;
    screenshot

  let push_screenshot id p =
    screenshot_list := 
      (id, p) :: 
      (List.filter (fun (id',_) -> id <> id') !screenshot_list)

  let af id replace_fun =
    try 
      let screenshot_ref = pop_screenshot id in
      match !screenshot_ref with 
      | None -> raise Not_found
      | Some uri ->
        let delay = 0.05 in
        let _,scr_height = Ot_size.get_screen_size () in
        let old_body = Of_dom.of_body Dom_html.document##.body in
        let history_page_div = div ~a:[a_class ["mp-page-container"]] [] in
        Manip.appendChild old_body history_page_div;
        Manip.SetCss.heightPx history_page_div scr_height;
        Manip.SetCss.backgroundImage 
          history_page_div ("url(\"" ^ Js.to_string uri ^ "\")");
        let%lwt () = Lwt_js_events.request_animation_frame () in
        let%lwt () = Lwt_js.sleep delay in
        Manip.Class.add history_page_div "mp-page-move";
        let%lwt () = Lwt_js.sleep 0.5 in
        let%lwt () = replace_fun () in
        Manip.removeChild old_body history_page_div;
        screenshot_ref := None;
        Lwt.return_unit
    with _ ->
      Dom_html.window##alert (Js.string "Nothing");
      replace_fun ()

  let hc_handler id () = 
    let screenshot_ref = create_screenshot_ref () in
    push_screenshot id screenshot_ref;
    let call_back error response =
      Js.Opt.case 
        error
        (fun () ->
           let uri = Js.Unsafe.get response "URI" in
           screenshot_ref := Some uri ) 
        (fun e -> window##alert e) in
    Npt_plugin.get_screen_shot ~quality:50 call_back ()

  let () =
    Eliom_client.set_animation_function af ;
    Eliom_client.set_history_changepage_handler hc_handler
]

let%shared main_service_handler =
  (fun () () ->
     ignore (
       [%client (
         let%lwt () = Lwt_js_events.request_animation_frame () in
         Eliom_client.onchangepage(Eliom_client.push_history_dom);
         main_service_onload_handler ();
         Lwt.return_unit: unit Lwt.t)] );
     let f = Form.post_form
         ~service:page2_service
         (fun msg_name ->
            [p [pcdata "Write an message : ";
                Form.input ~input_type:`Text ~name:msg_name Form.string ;
                Form.input ~input_type:`Submit ~value:"Submit" Form.string
               ]]) () in
     let page = 
       (Eliom_tools.F.html
          ~title:"msp"
          ~css:[["css";"msp.css"]]
          ~other_head:other_head
          Html.F.(body [
            div ~a:[a_class ["mp-head"]] [];
            div ~a:[a_class ["mp-head-chevron-container"]] 
              [span ~a:[a_class ["mp-head-chevron";"mp-faded"]] [pcdata "Discover"]];
            div ~a:[a_class ["mp-head-title-discover-container"]] 
              [span ~a:[a_class ["mp-head-title-discover";"mp-faded"]] [pcdata "Discover"] ];
            div ~a:[a_class ["mp-head-title-moment-container"]] 
              [span ~a:[a_class ["mp-head-title-moment";"mp-faded"]] [pcdata "Moments"]];
            div ~a:[a_class ["mp-main-wrapper"]] 
              [ul ~a:[a_class ["mp-news-container"]] []];
            button ~a:[a_class ["mp-button"]] [pcdata "add"];
            f
          ])) in          
     Lwt.return page 
  )

let%shared page1_service_handler =
  (fun () () ->
     ignore ([%client (
       let%lwt () = Lwt_js_events.request_animation_frame () in
       page1_service_onload_handler ();
       Lwt.return_unit : unit Lwt.t)] );
     Lwt.return
       (Eliom_tools.F.html
          ~title:"msp"
          ~css:[["css";"msp.css"]]
          ~other_head:other_head
          Html.F.(body [
            div ~a:[a_class ["mp-head"]] [];
            div ~a:[a_class ["mp-head-chevron-container"]] 
              [span ~a:[a_class ["mp-head-chevron"]] [pcdata "Discover"]];
            div ~a:[a_class ["mp-head-title-moment-container"]] 
              [span ~a:[a_class ["mp-head-title-moment";"mp-faded"]] [pcdata "Moments"] ];
            div ~a:[a_class ["mp-head-title-discover-container"]] 
              [span ~a:[a_class ["mp-head-title-discover";"mp-faded"]] [pcdata "Discover"]];
            div ~a:[a_class ["mp-detail-wrapper"]] 
              [a ~service:main_service [pcdata "Retourner à la page d'accueil"] ()]
          ])))

let%shared page2_service_handler =
  (fun () message ->
     ignore 
       ([%client (
          let%lwt () = Lwt_js_events.request_animation_frame () in
          page2_service_onload_handler ();
          Lwt.return_unit : unit Lwt.t)]);
     Lwt.return 
       (Eliom_tools.F.html
          ~title:"scroll_demo"
          ~css:[["css";"msp.css"]]
          ~other_head:other_head
          Html.F.(body[
            div ~a:[a_class ["mp-go-back"]] [pcdata "Back"];
            Html.D.(a ~service:main_service [pcdata "Retourner à la page d'accueil"] ());
            div [pcdata ("message : " ^ message)]]))
  )

let%shared () =
  Npt_base.App.register ~service:main_service main_service_handler;
  Npt_base.App.register ~service:page1_service page1_service_handler;
  Npt_base.App.register ~service:page2_service page2_service_handler


