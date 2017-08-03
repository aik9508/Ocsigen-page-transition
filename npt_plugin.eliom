[%%client.start]

open Dom_html

let get_screen_shot ?(quality=50) call_back_fun () : unit = 
  let screenshot = Js.Unsafe.get window##.navigator "screenshot" in
  let f_callback = 
    Js.wrap_callback call_back_fun in
  Js.Unsafe.meth_call 
    screenshot "URI" 
    [|Js.Unsafe.inject f_callback ;
      Js.Unsafe.inject quality|]