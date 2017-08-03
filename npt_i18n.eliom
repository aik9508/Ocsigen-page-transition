[%%shared type t = En|Fr]
[%%shared exception Unknown_language of string]
let%shared string_of_language = function 
| En -> "en"| Fr -> "fr"
let%shared language_of_string = function
| "en" -> En| "fr" -> Fr| s -> raise (Unknown_language s)
let%shared guess_language_of_string s = 
try language_of_string s 
with Unknown_language _ -> 
language_of_string (String.sub s 0 (String.index s '-'))
let%shared languages = [En;Fr]
let%shared default_language = En
let%server _language_ =
Eliom_reference.Volatile.eref
~scope:Eliom_common.default_process_scope default_language
let%server get_language () = Eliom_reference.Volatile.get _language_
let%server set_language language = 
Eliom_reference.Volatile.set _language_ language

let%client _language_ = ref default_language
let%client get_language () = !_language_
let%client set_language language = _language_ := language

let%shared pcdata = Eliom_content.Html.F.pcdata
[%%shared
module Tr = struct
let welcome_text1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Welcome to Ocsigen Start. This is a template for applications based on Ocsigen (Eliom, Js_of_ocaml, etc.)."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Bienvenue dans Ocsigen Start\194\160! Ceci est un template d'application \195\169crite avec Ocsigen (Eliom, Js_of_ocaml, etc.)."]])
let welcome_text2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Use it:"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Utilisez-le\194\160:"]])
let welcome_text3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "As a basis for your own applications."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Comme point de d\195\169part pour vos propres applications\194\160;"]])
let welcome_text4 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "To learn the most important concepts of client-server programming with Ocsigen."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Pour apprendre les principaux concepts de la programmation client-serveur avec Ocsigen."]])
let welcome_text5 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This application contains:"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cette application contient\194\160:"]])
let welcome_text6 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Features for user management (log-in form, user registration, activation links, password recovery, settings page, etc.)."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Des fonctionnalit\195\169s de gestion des utilisateurs (connexion, cr\195\169ation d'utilisateur, liens d'activation, r\195\169cup\195\169ration de mot de passe, param\195\168tres de l'utilisateur,...)\194\160;"]])
let welcome_text7 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "An extensive demo of the most important features you need to implement your own app. Read the source code to learn! And remove the demo part when you're ready to start with your own app."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Une d\195\169mo des plus importantes fonctionnalit\195\169s dont vous avez besoin pour \195\169crire votre propre application. Lisez le code source pour apprendre\194\160! Ensuite enlevez la partie demo quand vous \195\170tes pr\195\170ts \195\160 commencer votre propre application\194\160;"]])
let welcome_text8 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "A library with useful features (tips, notifications, etc.)."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Une biblioth\195\168que avec de nombeuses fonctionnalit\195\169s utiles (tips, notifications, etc.)\194\160;"]])
let welcome_text9 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "All the features you need to create a multilingual app."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Tous les outils pour cr\195\169er une application multilingue\194\160;"]])
let welcome_text10 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "A basic responsive CSS."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Une feuille de style \"responsive\" basique."]])
let welcome_text11 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This application is multi-platform: it can run as a client-server Web application (with server-side generated pages) and as a mobile app (with client-side generated pages) for Android, iOS or Windows. Have a look at the README file to learn how to generate the mobile apps, which you will be able to upload on Google Play or Apple App Store. "]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cette application est multi-plateforme\194\160: elle peut tourner comme application Web client-serveur (avec des pages g\195\169n\195\169r\195\169es c\195\180t\195\169 serveur) ou bien comme application mobile pour iOS, Android ou Windows (avec des pages g\195\169n\195\169r\195\169es c\195\180t\195\169 client). Regardez le fichier README pour apprendre comment g\195\169n\195\169rer les applications mobiles que vous pourrez envoyer sur Google Play ou Apple App Store."]])
let about_handler_template ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This template provides a skeleton for an Ocsigen application."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ce template fournit une base pour une application Ocsigen."]])
let about_handler_license ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Feel free to modify the generated code and use it or redistribute it in any way you want."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Vous \195\170tes libres de modifier le code g\195\169n\195\169r\195\169 et de l'utiliser ou le redistribuer comme vous le souhaitez."]])
let footer_generated ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This application has been generated using the"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cette application a \195\169t\195\169 g\195\169n\195\169r\195\169e en utilisant le template d'"]])
let footer_eliom_distillery ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "template for Eliom-distillery and uses the"]])
| Fr -> (fun  () -> List.flatten [[pcdata "avec Eliom-distillery et utilise les technologies"]])
let footer_technology ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata " technology."]])
| Fr -> (fun  () -> List.flatten [[pcdata "."]])
let home ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "H" else "h")];[pcdata "ome"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "H" else "h")];[pcdata "ome"]])
let about ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "A" else "a")];[pcdata "bout"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "\195\128" else "\195\160")];[pcdata " propos"]])
let demo ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Demo"]])
| Fr -> (fun  () -> List.flatten [[pcdata "D\195\169mo"]])
let password ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "P" else "p")];[pcdata "assword"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "M" else "m")];[pcdata "ot de passe"]])
let retype_password ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "retype your password"]])
| Fr -> (fun  () -> List.flatten [[pcdata "retapez votre mot de passe"]])
let your_email ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "Y" else "y")];[pcdata "our email"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "V" else "v")];[pcdata "otre e-mail"]])
let your_password ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "Y" else "y")];[pcdata "our password"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "V" else "v")];[pcdata "otre mot de passe"]])
let keep_logged_in ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "keep me logged in"]])
| Fr -> (fun  () -> List.flatten [[pcdata "rester connect\195\169"]])
let sign_in ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "S" else "s")];[pcdata "ign in"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "S" else "s")];[pcdata "e connecter"]])
let forgot_your_password_q ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "F" else "f")];[pcdata "orgot your password?"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "M" else "m")];[pcdata "ot de passe oubli\195\169\194\160?"]])
let sign_up ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "S" else "s")];[pcdata "ign up"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "S" else "s")];[pcdata "'enregistrer"]])
let logout ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "L" else "l")];[pcdata "ogout"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "S" else "s")];[pcdata "e d\195\169connecter"]])
let set_as_main_email ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "S" else "s")];[pcdata "et as main email"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "D" else "d")];[pcdata "\195\169finir comme e-mail principal"]])
let validated ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) ?(f=false) () -> List.flatten [[pcdata (if capitalize then "V" else "v")];[pcdata "alidated"]])
| Fr -> (fun ?(capitalize=false) ?(f=false) () -> List.flatten [[pcdata (if capitalize then "V" else "v")];[pcdata "alid\195\169"];[pcdata (if f then "e" else "")]])
let waiting_confirmation ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "W" else "w")];[pcdata "aiting for confirmation"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "E" else "e")];[pcdata "n attente de confirmation"]])
let main_email ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "M" else "m")];[pcdata "ain email"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "E" else "e")];[pcdata "-mail principal"]])
let change_password ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "C" else "c")];[pcdata "hange your password:"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "C" else "c")];[pcdata "hanger votre mot de passe\194\160:"]])
let link_new_email ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Link a new email to your account:"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ajouter une adresse e-mail \195\160 votre compte\194\160:"]])
let currently_registered_emails ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Currently registered emails:"]])
| Fr -> (fun  () -> List.flatten [[pcdata "E-mails actuellement enregistr\195\169s\194\160:"]])
let settings ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "S" else "s")];[pcdata "ettings"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "P" else "p")];[pcdata "aram\195\168tres"]])
let error ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "E" else "e")];[pcdata "rror"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "E" else "e")];[pcdata "rreur"]])
let example_tip ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This is an example of tip."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ceci est un exemple de tip."]])
let look_module_tip ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Look at the code to see how it is defined."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Regardez le code pour voir comment c'est d\195\169fini."]])
let passwords_do_not_match ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Passwords do not match"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Les mots de passe ne correspondent pas"]])
let generate_action_link_key_subject_email ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "creation"]])
| Fr -> (fun  () -> List.flatten [[pcdata "cr\195\169ation"]])
let sign_up_email_msg ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Welcome!\\r\\nTo confirm your email address, please click on this link:"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Bienvenue\194\160!\\r\\nPour confirmer votre adresse e-mail, cliquer sur ce lien\194\160:"]])
let email_already_exists ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Email already exists"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cet e-mail existe d\195\169j\195\160"]])
let user_does_not_exist ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "user does not exist"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cet utilisateur n'existe pas"]])
let account_not_activated ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Account not activated"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ce compte n'est pas activ\195\169"]])
let wrong_password ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Wrong password"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Mauvais mot de passe"]])
let add_email_msg ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Welcome!\\r\\nTo confirm your email address, please click on this link:"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Bienvenue\194\160!\\r\\nPour confirmer votre adresse e-mail, cliquez sur ce lien\194\160:"]])
let invalid_action_key ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Invalid action key, please ask for a new one."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Clef d'action invalide. Demandez en un nouveau svp."]])
let forgot_pwd_email_msg ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Hi,\\r\\nTo set a new password, please click on this link: Bonjour,\\r\\nPour mettre \195\160 jour votre mot de passe, cliquez sur ce lien\194\160:"]])
| Fr -> (fun  () -> List.flatten [])
let must_be_connected_to_see_page ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "You must be connected to see this page."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Vous devez \195\170tre connect\195\169 pour voir cette page."]])
let email_address ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Email address"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Adresse e-mail"]])
let your_first_name ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Your first name"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Votre pr\195\169nom"]])
let your_last_name ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Your last name"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Votre nom"]])
let submit ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "S" else "s")];[pcdata "ubmit"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "E" else "e")];[pcdata "nvoyer"]])
let see_help_again_from_beginning ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "See help again from beginning"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Revoir l'aide depuis le d\195\169but"]])
let personal_information_not_set ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Your personal information has not been set yet."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Vous n'avez pas encore entr\195\169 vos donn\195\169es personnelles."]])
let take_time_enter_name_password ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Please take time to enter your name and to set a password."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Veuillez entrer votre nom et choisir un mot de passe svp."]])
let wrong_data_fix ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Wrong data. Please fix."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Donn\195\169es incorrectes. Veuillez corriger."]])
let send ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "S" else "s")];[pcdata "end"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "E" else "e")];[pcdata "nvoyer"]])
let recover_password ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "R" else "r")];[pcdata "ecover password"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "R" else "r")];[pcdata "\195\169cup\195\169rer le mot de passe."]])
let welcome ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "W" else "w")];[pcdata "elcome!"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "B" else "b")];[pcdata "ienvenue\194\160!"]])
let log_in_to_see_page ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "L" else "l")];[pcdata "og in to see this page."]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "C" else "c")];[pcdata "onnectez-vous pour voir cette page."]])
let you_click_on_date ?(lang = get_language ()) () =
match lang with
| En -> (fun ~d ~m ~y () -> List.flatten [[pcdata "You clicked on "];y;[pcdata "/"];m;[pcdata "/"];d])
| Fr -> (fun ~d ~m ~y () -> List.flatten [[pcdata "Vous avez cliqu\195\169 sur "];d;[pcdata "/"];m;[pcdata "/"];y])
let you_click_on_time ?(lang = get_language ()) () =
match lang with
| En -> (fun ~h ~m () -> List.flatten [[pcdata "You clicked on "];h;[pcdata ":"];m])
| Fr -> (fun ~h ~m () -> List.flatten [[pcdata "Vous avez cliqu\195\169 sur "];h;[pcdata ":"];m])
let demo_cache ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Cache"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cache"]])
let demo_calendar ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Calendar"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Calendrier"]])
let this_page_show_calendar ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This page shows Ocsigen Toolkit's date picker."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cette page montre le s\195\169lecteur de date d'Ocsigen Toolkit."]])
let demo_carousel_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Carousel"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Carousel"]])
let ot_carousel_first_example_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This is a first example of the Ocsigen Toolkit's carousel."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Voici le premier exemple du carousel d'Ocsigen Toolkit."]])
let ot_carousel_first_example_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "The carousel displays a number of blocks side-by-side (or vertically stacked)."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Le carousel sert \195\160 afficher des blocs c\195\180te-\195\160-c\195\180te (ou empil\195\169s verticalement)."]])
let ot_carousel_first_example_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "To switch to a different block, use the buttons in the carousel."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Pour vous rendre sur un autre bloc, utilisez les boutons dans le carousel."]])
let ot_carousel_first_example_4 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "On touch screens you can also swipe with your fingers."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Sur les \195\169crans tactiles, swipez avec les doigts."]])
let demo_carousel_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Carousel: page with tabs"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Carousel\194\160: page avec onglet"]])
let ot_carousel_second_example_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This page demonstrates how to use Ocsigen Toolkit's carousel to display a page with several tabs."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cette page montre comment utiliser le carousel d'Ocsigen Toolkit pour afficher une page avec des onglets."]])
let ot_carousel_second_example_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Try to swipe on a touch screen."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Sur \195\169cran tactile, glissez pour changer d'onglet."]])
let ot_carousel_second_example_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Try on a small screen or browser window to see how the tabs stick on top while scrolling the page."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Essayez sur un petit \195\169cran pour voir comment la barre d'onglets se fixe en haut de la page quand vous faites d\195\169filer la page vers le bas."]])
let monday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Monday"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Lundi"]])
let tuesday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Tuesday"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Mardi"]])
let wednesday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Wednesday"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Mercredi"]])
let thursday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Thursday"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Jeudi"]])
let friday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Friday"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Vendredi"]])
let saturday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Saturday"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Samedi"]])
let sunday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Sunday"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Dimanche"]])
let demo_carousel_wheel ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Wheel carousel"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Carousel avec roulette"]])
let demo_carousel_third_example_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Example of a vertical circular carousel (wheel). Try with a touch screen."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Exemple de carousel vertical circulaire (wheel). Essayez avec un \195\169cran tactile."]])
let demo_notification ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Notifications"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Notifications"]])
let demo_notification_got ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "got"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Re\195\167u"]])
let exchange_msg_between_users ?(lang = get_language ()) () =
match lang with
| En -> (fun ~os_notif () -> List.flatten [[pcdata "Module "];os_notif;[pcdata " enables sending information to client applications (notifications, new messages ...)."]])
| Fr -> (fun ~os_notif () -> List.flatten [[pcdata "Le module "];os_notif;[pcdata " permet des donn\195\169es aux applications client (notifications, nouveaux messages,...)."]])
let open_multiple_tabs_browsers ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Open this page in multiple tabs or browsers."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ouvrez cette page dans plusieurs onglets et fen\195\170tres."]])
let fill_input_form_send_message ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Fill in the input form to send a message to all other tabs."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Remplissez le formulaire pour envoyer un message \195\160 tous vos autres onglets ouverts."]])
let send_message ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "send message"]])
| Fr -> (fun  () -> List.flatten [[pcdata "envoyer le message"]])
let demo_pgocaml ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Database request"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Requ\195\170te \195\160 la base de donn\195\169es."]])
let no_user_create_accounts ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "No user. Create some accounts to test."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Aucun utilisateur. Cr\195\169ez quelques comptes pour tester."]])
let demo_pgocaml_users ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Users:"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Utilisateurs\194\160:"]])
let demo_pgocaml_description_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This page shows signed-up users fetched from the database."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cette page montre tous les utilisateurs inscrits qui ont \195\169t\195\169 r\195\169cup\195\169r\195\169s de la base de donn\195\169es."]])
let demo_pgocaml_description_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Have a look at the source code to see how to make a DB request with PGOCaml."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Regardez dans le code source comment r\195\169aliser une requ\195\170te \195\160 la base de donn\195\169es en utilisant PGOcaml."]])
let demo_pgocaml_description_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "We are using Ot_spinner to display the list, which means that, in the case the page is generated client-side, the page will be displayed immediately with a spinner, that will be replaced by the contents when ready. The code contains a 2s sleep to demonstrate the spinner."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Nous utilisons Ot_spinner pour afficher la liste\194\160: dans le cas o\195\185 une page est g\195\169n\195\169r\195\169e c\195\180t\195\169 client, cette page est affich\195\169e imm\195\169diatement avec une ic\195\180ne de chargement qui sera remplac\195\169e par le contenu quand il sera pr\195\170t. Pour la d\195\169monstration, nous avons ajout\195\169 une pause de 2s pour laisser le temps de voir l'ic\195\180ne de chargement."]])
let demo_popup ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Popup Button"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Bouton popup"]])
let demo_popup_click ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Click for a popup!"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cliquez pour afficher un popup\194\160!"]])
let demo_popup_message ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Popup message"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Message du popup"]])
let demo_popup_content ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Here is a button showing a simple popup window when clicked:"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Voici un bouton affichant une simple fen\195\170tre popup quand vous cliquez dessus\194\160:"]])
let demo_reactive_programming ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Reactive pages"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Pages r\195\169actives"]])
let demo_reactive_programming_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This is an example of a page with reactive content. It is a very convenient solution to update pages when data changes."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ceci est un exemple d'une page avec du contenu r\195\169actif. C'est une solution extr\195\170ment simple pour mettre \195\160 jour une page quand les donn\195\169es changent."]])
let demo_reactive_programming_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "It defines a (client-side) reactive OCaml list. You can add elements in this list via the input form. The page is updated automatically when the value of the reactive list changes."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Il d\195\169finit une liste OCaml r\195\169active (c\195\180t\195\169 client). Vous pouvez ajouter des \195\169lements dans cette liste via le formulaire. Cette page sera automatique mise \195\160 jour quand la valeur de la liste r\195\169active changera."]])
let demo_reactive_programming_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "The reactive page is generated either server-side (for example when you are using a Web browser and you reload this page) or client-side (in a mobile app or if you were already in the app before coming to this page)."]])
| Fr -> (fun  () -> List.flatten [[pcdata "La page r\195\169active est g\195\169n\195\169r\195\169e aussi bien du c\195\180t\195\169 serveur (par exemple quand vous utilisez le navigateur web et que vous rechargez cette page) que du c\195\180t\195\169 client (sur mobile ou si vous \195\169tiez d\195\169j\195\160 sur dans cette application avant de venir sur cette page)."]])
let demo_eliom_ref ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Eliom references + OS dates"]])
| Fr -> (fun  () -> List.flatten [[pcdata "R\195\169f\195\169rences Eliom + dates OS"]])
let demo_eliom_ref_first_visit ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This is your first visit."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ceci est votre premi\195\168re visite."]])
let demo_eliom_ref_last_visit ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "The last time you visited was: "]])
| Fr -> (fun  () -> List.flatten [[pcdata " La derni\195\168re fois que vous avez visit\195\169 ce lien \195\169tait\194\160:"]])
let demo_eliom_ref_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "We use an Eliom reference to record the last time you visited this page. Eliom references make it possible to save, server-side, data specific to one user, one browser, or one tab. "]])
| Fr -> (fun  () -> List.flatten [[pcdata "Nous utilisons les r\195\169f\195\169rences Eliom pour sauvegarder la date de la derni\195\168re fois que vous avez visit\195\169 cette page. Les r\195\169f\195\169rences Eliom permettent de sauvegarder c\195\180t\195\169 serveur des donn\195\169es propres \195\160 un utilisateur, \195\160 un navigateur ou \195\160 un onglet."]])
let demo_eliom_ref_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "The value is different for each user."]])
| Fr -> (fun  () -> List.flatten [[pcdata "La valeur est diff\195\169rente pour chaque utilisateur."]])
let demo_eliom_ref_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "The reference has been updated. Come back later!"]])
| Fr -> (fun  () -> List.flatten [[pcdata "La r\195\169f\195\169rence a \195\169t\195\169 mise \195\160 jour. Revenez plus tard\194\160!"]])
let demo_rpc_button ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "RPC button"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Bouton RPC"]])
let demo_rpc_button_click_increase ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Click to increase server-side value"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cliquez pour augmenter la valeur c\195\180t\195\169 serveur."]])
let demo_rpc_button_description ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This button performs an RPC to increase a server-side value."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ce bouton r\195\169alise un appel de fonction distante (RPC) pour augmenter une valeur c\195\180t\195\169 serveur."]])
let demo_spinner ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Spinner"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ic\195\180ne de chargement"]])
let demo_spinner_content_ready ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "The content is ready. "]])
| Fr -> (fun  () -> List.flatten [[pcdata "Le contenu est pr\195\170t."]])
let demo_spinner_message_replace_spinner ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This message has replaced the spinner."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ce message a remplac\195\169 l'ic\195\180ne de chargement."]])
let demo_spinner_description_ot ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This is a demo of the Ocsigen Toolkit spinner widget."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ceci est la d\195\169monstration de l'ic\195\180ne de chargement d'Ocsigen Toolkit."]])
let demo_spinner_description_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "We use this widget to integrate into the page an HTML block that takes a long time to produce, e.g., because of a slow server call."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Nous utilisons ce widget pour int\195\169grer dans notre page HTML un bloc qui prend un long moment \195\160 produire, par exemple, \195\160 cause d'un appel serveur lent."]])
let demo_spinner_description_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "A spinner is displayed, which is then replaced with the actual content when this content is ready."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Une ic\195\180ne de chargement est d'abord affich\195\169e, puis remplac\195\169e par le vrai contenu quand celui-ci est pr\195\170t."]])
let demo_spinner_description_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "For the demo we just sleep for 5 seconds to simulate waiting for the content."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Pour la d\195\169monstration, nous avons ajout\195\169 un d\195\169lai de 5 secondes pour simuler l'attente du contenu."]])
let demo_spinner_generated_client_side ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "The spinner is generated client-side."]])
| Fr -> (fun  () -> List.flatten [[pcdata "L'ic\195\180ne de chargement est g\195\169n\195\169r\195\169e c\195\180t\195\169 client."]])
let demo_timepicker ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Time picker"]])
| Fr -> (fun  () -> List.flatten [[pcdata "S\195\169lecteur d'heure"]])
let demo_timepicker_back_to_hours ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Back to hours"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Revenir aux heures"]])
let demo_timepicker_description ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This page shows the Ocsigen Toolkit's time picker."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cette page montre le s\195\169lecteur d'heure d'Ocsigen Toolkit."]])
let demo_tips ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Tips"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Astuces"]])
let change_profile_picture ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Change profile picture"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Changer votre photo de profil."]])
let demo_widget_ot ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This app also contains demos for some widgets from Ocsigen Toolkit."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cette application contient \195\169galement des d\195\169monstrations de quelques widgets d'Ocsigen Toolkit."]])
let demo_widget_see_drawer ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "The different demos are accessible through the drawer menu. To open it click the top left button on the screen."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Les diff\195\169rentes d\195\169monstrations sont accessibles \195\160 travers le menu. Pour l'ouvrir, cliquez sur le bouton en haut \195\160 gauche de l'\195\169cran."]])
let demo_widget_feel_free ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Feel free to modify the generated code and use it or redistribute it as you want."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Vous \195\170tes libres de modifier le code g\195\169n\195\169r\195\169 et de l'utiliser ou de le redistribuer comme vous souhaitez."]])
let users ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Users"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Utilisateurs"]])
let you_are_not_connected ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "You are not connected."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Vous n'\195\170tes pas connect\195\169."]])
let you_are ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "You are"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Vous \195\170tes"]])
let log_in_to_see_demo ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Log in to see the demo."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Connectez-vous pour voir la d\195\169monstration."]])
let your_user_id ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Your user id"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Votre ID utilisateur"]])
let the_module ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "The module"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Le module"]])
let allows_get_information_currently_connected_user ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "provides information about the currently connected user (server or client side)."]])
| Fr -> (fun  () -> List.flatten [[pcdata "vous autorise \195\160 obtenir les information de l'utilisateur courant connect\195\169 (c\195\180t\195\169 serveur ou c\195\180t\195\169 client)."]])
let these_functions_called_server_or_client_side ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "These functions can be called from either server- or client-side."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ces fonctions peuvent \195\170tre appel\195\169es aussi bien c\195\180t\195\169 client que c\195\180t\195\169 serveur."]])
let always_get_current_user_using_module ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Always get the current user id using module"]])
| Fr -> (fun  () -> List.flatten [[pcdata "R\195\169cup\195\169rez toujours l'ID de l'utilisateur courant en utilisant le module"]])
let never_trust_client_pending_user_id ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Never trust a client sending its own user id!"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ne faites jamais confiance \195\160 un client envoyant son propre ID d'utilisateur\194\160!"]])
let internationalization ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "I" else "i")];[pcdata "nternationalization"]])
| Fr -> (fun ?(capitalize=false) () -> List.flatten [[pcdata (if capitalize then "I" else "i")];[pcdata "nternationalisation"]])
let internationalization_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Ocsigen Start uses Ocsigen-i18n for internationalizing your app. Ocsigen-i18n defines a PPX syntax extension for automatically selecting language-dependent text for each user. The user can choose his preferred language from the settings page. By default the browser's language is used."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ocsigen Start utilise Ocsigen-i18n for internationaliser les applications. Ocsigen-i18n d\195\169finit une extension de syntaxe PPX qui s\195\169lectionne automatiquement les textes en fonction de la langue de l'utilisateur courant. L'utilisateur peut choisir sa langue pr\195\169f\195\169r\195\169e dans la page de param\195\168tres. Par d\195\169faut, la langue du navigateur est utilis\195\169e."]])
let internationalization_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~f1 ~f2 () -> List.flatten [[pcdata "Write your translations (as tab-separated-values) in file "];f1;[pcdata ". File "];f2;[pcdata " is generated automatically from this file."]])
| Fr -> (fun ~f1 ~f2 () -> List.flatten [[pcdata "\195\137crivez vos traductions (au format \"tab-separated-values\") dans le fichier "];f1;[pcdata ". Le fichier "];f2;[pcdata " est g\195\169n\195\169r\195\169 automatiquement \195\160 partir de ce fichier."]])
let internationalization_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Have a look at the OCaml code of this page to discover some features of the module Ocsigen-i18n."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Jetez un coup d'\197\147il au code OCaml de cette page pour d\195\169couvrir quelques astuces du module Ocsigen-i18n."]])
let links_and_static_files ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Links, services and static files"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Liens, services et fichiers statiques"]])
let services ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Services"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Services"]])
let services_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~f1 ~f2 ~f3 () -> List.flatten [[pcdata "Have a look at file "];f1;[pcdata " to see some examples of service definitions. Most service handlers are defined in file "];f2;[pcdata ". Service registration is done in "];f3;[pcdata ". Have a look to see how to define a service returning an application page, an action or a redirection, etc. Read Ocsigen's tutorials and Eliom's manual for more information about services."]])
| Fr -> (fun ~f1 ~f2 ~f3 () -> List.flatten [[pcdata "Vous trouverez des exemples de d\195\169finition de services dans le fichier "];f1;[pcdata ". La plupart des handlers de services sont d\195\169finis dans le fichier "];f2;[pcdata ". L'enregistrement des services est fait dans le fichier "];f3;[pcdata ". Jetez-y un \197\147il pour voir comment d\195\169finir une nouvelle page pour cette application, une action, une redirection, etc. Lisez les tutoriels d'Ocsigen et le manuel d'Eliom pour plus d'informations sur les services."]])
let links_and_forms ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Links and forms"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Liens et formulaires"]])
let links_and_forms_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~t1 ~t2 () -> List.flatten [[pcdata "Here is an example of an "];t1;[pcdata ", and an example of link towards an "];t2;[pcdata "."]])
| Fr -> (fun ~t1 ~t2 () -> List.flatten [[pcdata "Voici un exemple de "];t1;[pcdata ", et un exemple de lien vers un "];t2;[pcdata "."]])
let internal_link ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "internal link"]])
| Fr -> (fun  () -> List.flatten [[pcdata "lien interne"]])
let external_service ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "external service"]])
| Fr -> (fun  () -> List.flatten [[pcdata "service externe"]])
let static_files ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Static files"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Fichiers statiques"]])
let static_files_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~static ~static_dir () -> List.flatten [[pcdata "Use service "];static_dir;[pcdata " (predefined in Eliom) to create links towards static files (images, fonts, etc.). Put static files you want to include in the mobile app in directory "];static;[pcdata ". They will be stored locally on the mobile device. By default, links are relative on the Web app and absolute on the mobile app. For example, here is an example of an image stored locally in the mobile app:"]])
| Fr -> (fun ~static ~static_dir () -> List.flatten [[pcdata "Utilisez le service "];static_dir;[pcdata " (pr\195\169d\195\169fini dans Eliom) pour faire des liens vers des fichiers statiques (images, fontes, etc.). Les fichiers statiques que vous voulez inclure dans l'application mobile doivent \195\170tre plac\195\169s dans le r\195\169pertoire "];static;[pcdata ". Ils seront stock\195\169s en local sur l'appareil mobile. Par d\195\169faut les liens sont relatifs dans l'application Web et absolus dans l'application mobile. Forcez les liens relatifs pour faire des liens vers des fichiers locaux dans l'application mobile. Par exemple voici une image stock\195\169e localement dans l'application mobile\194\160:"]])
let static_files_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "and a remote image:"]])
| Fr -> (fun  () -> List.flatten [[pcdata "et une image distante\194\160:"]])
let change_language ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Change language"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Changer la langue"]])
let tips1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Tips for new users and new features"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Astuces pour les nouveaux utilisateurs et nouvelles fonctionnalit\195\169s"]])
let tips2 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~os_tips () -> List.flatten [[pcdata "Module "];os_tips;[pcdata " implements a way to display tips in the page to the users who haven't already seen them."]])
| Fr -> (fun ~os_tips () -> List.flatten [[pcdata "Le module "];os_tips;[pcdata " impl\195\169mente une fa\195\167on d'afficher des astuces dans la page aux utilisateurs qui ne les ont pas d\195\169j\195\160 vues."]])
let tips3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "This page contains a tip, that you will see only as connected user, until you close it."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Cette page contient une astuce, que vous allez voir seulement en tant qu'utilisateur connect\195\169, jusqu'\195\160 ce que vous la fermiez."]])
let tips4 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~set_page () -> List.flatten [[pcdata "It is possible to reset the set of already seen tips from the "];set_page;[pcdata "."]])
| Fr -> (fun ~set_page () -> List.flatten [[pcdata "Il est possible de r\195\169initialiser l'ensemble des astuces d\195\169j\195\160 vues depuis la page "];set_page;[pcdata "."]])
let tips5 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "settings page"]])
| Fr -> (fun  () -> List.flatten [[pcdata "page Param\195\168tres"]])
let demo_intro ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Demo: introduction"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Demo\194\160: introduction"]])
let general_principles ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "General principles"]])
| Fr -> (fun  () -> List.flatten [[pcdata "Principes g\195\169n\195\169raux"]])
let demo_intro_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Ocsigen provides a set of largely independent tools for implementing Web and mobile applications (OCaml to JS compiler, Web server, typed HTML, etc.). Ocsigen can be used to implement, depending on your needs, either traditional Web sites (server-side), or client-side apps running in a browser, or full client-server apps, running both in a browser and as mobile apps. Ocsigen Start is a template for quickly writing such a client-server app."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ocsigen fournit un ensemble d'outils largement ind\195\169pendants pour programmer des applications Web et mobiles (compilateur OCaml vers Javascript, serveur Web, HTML typ\195\169, etc.). Cela vous permet d'\195\169crire, selon vos besoins, des sites Web traditionnels (c\195\180t\195\169 serveur), des applications clientes s'ex\195\169cutant dans une page Web, ou de v\195\169ritables applications client-serveur, pouvant s'ex\195\169cuter dans un navigateur ou comme application mobile. Ocsigen Start est un template pr\195\170t \195\160 utiliser pour ce type d'applications client-serveur."]])
let demo_intro_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Ocsigen Eliom is a set of libraries for Web programming in OCaml: sessions, services, client-server communication, etc. It also contains an extension of the OCaml language to write a client-server program as a single app. Code annotations permit distinguishing between the code to be included in the server app, the code for the client app, and the code to be included in both of them. Have a look at the code of this app to learn how to generate typed HTML pages, how to call server function from client side, or how to send information to client applications (notifications)."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Ocsigen Eliom est un ensemble de biblioth\195\168ques pour la programmation Web en OCaml : sessions, services, communication client-serveur, etc. Il contient aussi une extension du langage OCaml permettant d'\195\169crire des applications client-serveur. Des annotations du code permettent de distinguer le code devant \195\170tre inclus dans l'application serveur, du code qui doit \195\170tre inclus dans l'application cliente. Regardez le code source de cette application pour apprendre comment g\195\169n\195\169rer des pages HTML bien typ\195\169es, comment appeler une fonction serveur depuis un programme client, ou encore comment envoyer des informations aux clients connect\195\169s (notifications)."]])
let demo_intro_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> List.flatten [[pcdata "Read tutorials on Ocsigen's Web site for a more detailed introduction."]])
| Fr -> (fun  () -> List.flatten [[pcdata "Lisez les tutoriels du site d'Ocsigen pour une introduction plus d\195\169taill\195\169e."]])
module S = struct
let welcome_text1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Welcome to Ocsigen Start. This is a template for applications based on Ocsigen (Eliom, Js_of_ocaml, etc.)."])
| Fr -> (fun  () -> String.concat "" ["Bienvenue dans Ocsigen Start\194\160! Ceci est un template d'application \195\169crite avec Ocsigen (Eliom, Js_of_ocaml, etc.)."])
let welcome_text2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Use it:"])
| Fr -> (fun  () -> String.concat "" ["Utilisez-le\194\160:"])
let welcome_text3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["As a basis for your own applications."])
| Fr -> (fun  () -> String.concat "" ["Comme point de d\195\169part pour vos propres applications\194\160;"])
let welcome_text4 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["To learn the most important concepts of client-server programming with Ocsigen."])
| Fr -> (fun  () -> String.concat "" ["Pour apprendre les principaux concepts de la programmation client-serveur avec Ocsigen."])
let welcome_text5 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This application contains:"])
| Fr -> (fun  () -> String.concat "" ["Cette application contient\194\160:"])
let welcome_text6 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Features for user management (log-in form, user registration, activation links, password recovery, settings page, etc.)."])
| Fr -> (fun  () -> String.concat "" ["Des fonctionnalit\195\169s de gestion des utilisateurs (connexion, cr\195\169ation d'utilisateur, liens d'activation, r\195\169cup\195\169ration de mot de passe, param\195\168tres de l'utilisateur,...)\194\160;"])
let welcome_text7 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["An extensive demo of the most important features you need to implement your own app. Read the source code to learn! And remove the demo part when you're ready to start with your own app."])
| Fr -> (fun  () -> String.concat "" ["Une d\195\169mo des plus importantes fonctionnalit\195\169s dont vous avez besoin pour \195\169crire votre propre application. Lisez le code source pour apprendre\194\160! Ensuite enlevez la partie demo quand vous \195\170tes pr\195\170ts \195\160 commencer votre propre application\194\160;"])
let welcome_text8 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["A library with useful features (tips, notifications, etc.)."])
| Fr -> (fun  () -> String.concat "" ["Une biblioth\195\168que avec de nombeuses fonctionnalit\195\169s utiles (tips, notifications, etc.)\194\160;"])
let welcome_text9 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["All the features you need to create a multilingual app."])
| Fr -> (fun  () -> String.concat "" ["Tous les outils pour cr\195\169er une application multilingue\194\160;"])
let welcome_text10 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["A basic responsive CSS."])
| Fr -> (fun  () -> String.concat "" ["Une feuille de style \"responsive\" basique."])
let welcome_text11 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This application is multi-platform: it can run as a client-server Web application (with server-side generated pages) and as a mobile app (with client-side generated pages) for Android, iOS or Windows. Have a look at the README file to learn how to generate the mobile apps, which you will be able to upload on Google Play or Apple App Store. "])
| Fr -> (fun  () -> String.concat "" ["Cette application est multi-plateforme\194\160: elle peut tourner comme application Web client-serveur (avec des pages g\195\169n\195\169r\195\169es c\195\180t\195\169 serveur) ou bien comme application mobile pour iOS, Android ou Windows (avec des pages g\195\169n\195\169r\195\169es c\195\180t\195\169 client). Regardez le fichier README pour apprendre comment g\195\169n\195\169rer les applications mobiles que vous pourrez envoyer sur Google Play ou Apple App Store."])
let about_handler_template ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This template provides a skeleton for an Ocsigen application."])
| Fr -> (fun  () -> String.concat "" ["Ce template fournit une base pour une application Ocsigen."])
let about_handler_license ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Feel free to modify the generated code and use it or redistribute it in any way you want."])
| Fr -> (fun  () -> String.concat "" ["Vous \195\170tes libres de modifier le code g\195\169n\195\169r\195\169 et de l'utiliser ou le redistribuer comme vous le souhaitez."])
let footer_generated ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This application has been generated using the"])
| Fr -> (fun  () -> String.concat "" ["Cette application a \195\169t\195\169 g\195\169n\195\169r\195\169e en utilisant le template d'"])
let footer_eliom_distillery ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["template for Eliom-distillery and uses the"])
| Fr -> (fun  () -> String.concat "" ["avec Eliom-distillery et utilise les technologies"])
let footer_technology ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" [" technology."])
| Fr -> (fun  () -> String.concat "" ["."])
let home ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "H" else "h");"ome"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "H" else "h");"ome"])
let about ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "A" else "a");"bout"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "\195\128" else "\195\160");" propos"])
let demo ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Demo"])
| Fr -> (fun  () -> String.concat "" ["D\195\169mo"])
let password ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "P" else "p");"assword"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "M" else "m");"ot de passe"])
let retype_password ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["retype your password"])
| Fr -> (fun  () -> String.concat "" ["retapez votre mot de passe"])
let your_email ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "Y" else "y");"our email"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "V" else "v");"otre e-mail"])
let your_password ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "Y" else "y");"our password"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "V" else "v");"otre mot de passe"])
let keep_logged_in ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["keep me logged in"])
| Fr -> (fun  () -> String.concat "" ["rester connect\195\169"])
let sign_in ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "S" else "s");"ign in"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "S" else "s");"e connecter"])
let forgot_your_password_q ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "F" else "f");"orgot your password?"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "M" else "m");"ot de passe oubli\195\169\194\160?"])
let sign_up ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "S" else "s");"ign up"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "S" else "s");"'enregistrer"])
let logout ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "L" else "l");"ogout"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "S" else "s");"e d\195\169connecter"])
let set_as_main_email ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "S" else "s");"et as main email"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "D" else "d");"\195\169finir comme e-mail principal"])
let validated ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) ?(f=false) () -> String.concat "" [(if capitalize then "V" else "v");"alidated"])
| Fr -> (fun ?(capitalize=false) ?(f=false) () -> String.concat "" [(if capitalize then "V" else "v");"alid\195\169";(if f then "e" else "")])
let waiting_confirmation ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "W" else "w");"aiting for confirmation"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "E" else "e");"n attente de confirmation"])
let main_email ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "M" else "m");"ain email"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "E" else "e");"-mail principal"])
let change_password ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "C" else "c");"hange your password:"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "C" else "c");"hanger votre mot de passe\194\160:"])
let link_new_email ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Link a new email to your account:"])
| Fr -> (fun  () -> String.concat "" ["Ajouter une adresse e-mail \195\160 votre compte\194\160:"])
let currently_registered_emails ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Currently registered emails:"])
| Fr -> (fun  () -> String.concat "" ["E-mails actuellement enregistr\195\169s\194\160:"])
let settings ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "S" else "s");"ettings"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "P" else "p");"aram\195\168tres"])
let error ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "E" else "e");"rror"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "E" else "e");"rreur"])
let example_tip ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This is an example of tip."])
| Fr -> (fun  () -> String.concat "" ["Ceci est un exemple de tip."])
let look_module_tip ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Look at the code to see how it is defined."])
| Fr -> (fun  () -> String.concat "" ["Regardez le code pour voir comment c'est d\195\169fini."])
let passwords_do_not_match ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Passwords do not match"])
| Fr -> (fun  () -> String.concat "" ["Les mots de passe ne correspondent pas"])
let generate_action_link_key_subject_email ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["creation"])
| Fr -> (fun  () -> String.concat "" ["cr\195\169ation"])
let sign_up_email_msg ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Welcome!\\r\\nTo confirm your email address, please click on this link:"])
| Fr -> (fun  () -> String.concat "" ["Bienvenue\194\160!\\r\\nPour confirmer votre adresse e-mail, cliquer sur ce lien\194\160:"])
let email_already_exists ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Email already exists"])
| Fr -> (fun  () -> String.concat "" ["Cet e-mail existe d\195\169j\195\160"])
let user_does_not_exist ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["user does not exist"])
| Fr -> (fun  () -> String.concat "" ["Cet utilisateur n'existe pas"])
let account_not_activated ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Account not activated"])
| Fr -> (fun  () -> String.concat "" ["Ce compte n'est pas activ\195\169"])
let wrong_password ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Wrong password"])
| Fr -> (fun  () -> String.concat "" ["Mauvais mot de passe"])
let add_email_msg ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Welcome!\\r\\nTo confirm your email address, please click on this link:"])
| Fr -> (fun  () -> String.concat "" ["Bienvenue\194\160!\\r\\nPour confirmer votre adresse e-mail, cliquez sur ce lien\194\160:"])
let invalid_action_key ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Invalid action key, please ask for a new one."])
| Fr -> (fun  () -> String.concat "" ["Clef d'action invalide. Demandez en un nouveau svp."])
let forgot_pwd_email_msg ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Hi,\\r\\nTo set a new password, please click on this link: Bonjour,\\r\\nPour mettre \195\160 jour votre mot de passe, cliquez sur ce lien\194\160:"])
| Fr -> (fun  () -> String.concat "" [])
let must_be_connected_to_see_page ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["You must be connected to see this page."])
| Fr -> (fun  () -> String.concat "" ["Vous devez \195\170tre connect\195\169 pour voir cette page."])
let email_address ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Email address"])
| Fr -> (fun  () -> String.concat "" ["Adresse e-mail"])
let your_first_name ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Your first name"])
| Fr -> (fun  () -> String.concat "" ["Votre pr\195\169nom"])
let your_last_name ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Your last name"])
| Fr -> (fun  () -> String.concat "" ["Votre nom"])
let submit ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "S" else "s");"ubmit"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "E" else "e");"nvoyer"])
let see_help_again_from_beginning ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["See help again from beginning"])
| Fr -> (fun  () -> String.concat "" ["Revoir l'aide depuis le d\195\169but"])
let personal_information_not_set ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Your personal information has not been set yet."])
| Fr -> (fun  () -> String.concat "" ["Vous n'avez pas encore entr\195\169 vos donn\195\169es personnelles."])
let take_time_enter_name_password ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Please take time to enter your name and to set a password."])
| Fr -> (fun  () -> String.concat "" ["Veuillez entrer votre nom et choisir un mot de passe svp."])
let wrong_data_fix ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Wrong data. Please fix."])
| Fr -> (fun  () -> String.concat "" ["Donn\195\169es incorrectes. Veuillez corriger."])
let send ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "S" else "s");"end"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "E" else "e");"nvoyer"])
let recover_password ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "R" else "r");"ecover password"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "R" else "r");"\195\169cup\195\169rer le mot de passe."])
let welcome ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "W" else "w");"elcome!"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "B" else "b");"ienvenue\194\160!"])
let log_in_to_see_page ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "L" else "l");"og in to see this page."])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "C" else "c");"onnectez-vous pour voir cette page."])
let you_click_on_date ?(lang = get_language ()) () =
match lang with
| En -> (fun ~d ~m ~y () -> String.concat "" ["You clicked on ";y;"/";m;"/";d])
| Fr -> (fun ~d ~m ~y () -> String.concat "" ["Vous avez cliqu\195\169 sur ";d;"/";m;"/";y])
let you_click_on_time ?(lang = get_language ()) () =
match lang with
| En -> (fun ~h ~m () -> String.concat "" ["You clicked on ";h;":";m])
| Fr -> (fun ~h ~m () -> String.concat "" ["Vous avez cliqu\195\169 sur ";h;":";m])
let demo_cache ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Cache"])
| Fr -> (fun  () -> String.concat "" ["Cache"])
let demo_calendar ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Calendar"])
| Fr -> (fun  () -> String.concat "" ["Calendrier"])
let this_page_show_calendar ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This page shows Ocsigen Toolkit's date picker."])
| Fr -> (fun  () -> String.concat "" ["Cette page montre le s\195\169lecteur de date d'Ocsigen Toolkit."])
let demo_carousel_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Carousel"])
| Fr -> (fun  () -> String.concat "" ["Carousel"])
let ot_carousel_first_example_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This is a first example of the Ocsigen Toolkit's carousel."])
| Fr -> (fun  () -> String.concat "" ["Voici le premier exemple du carousel d'Ocsigen Toolkit."])
let ot_carousel_first_example_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["The carousel displays a number of blocks side-by-side (or vertically stacked)."])
| Fr -> (fun  () -> String.concat "" ["Le carousel sert \195\160 afficher des blocs c\195\180te-\195\160-c\195\180te (ou empil\195\169s verticalement)."])
let ot_carousel_first_example_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["To switch to a different block, use the buttons in the carousel."])
| Fr -> (fun  () -> String.concat "" ["Pour vous rendre sur un autre bloc, utilisez les boutons dans le carousel."])
let ot_carousel_first_example_4 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["On touch screens you can also swipe with your fingers."])
| Fr -> (fun  () -> String.concat "" ["Sur les \195\169crans tactiles, swipez avec les doigts."])
let demo_carousel_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Carousel: page with tabs"])
| Fr -> (fun  () -> String.concat "" ["Carousel\194\160: page avec onglet"])
let ot_carousel_second_example_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This page demonstrates how to use Ocsigen Toolkit's carousel to display a page with several tabs."])
| Fr -> (fun  () -> String.concat "" ["Cette page montre comment utiliser le carousel d'Ocsigen Toolkit pour afficher une page avec des onglets."])
let ot_carousel_second_example_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Try to swipe on a touch screen."])
| Fr -> (fun  () -> String.concat "" ["Sur \195\169cran tactile, glissez pour changer d'onglet."])
let ot_carousel_second_example_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Try on a small screen or browser window to see how the tabs stick on top while scrolling the page."])
| Fr -> (fun  () -> String.concat "" ["Essayez sur un petit \195\169cran pour voir comment la barre d'onglets se fixe en haut de la page quand vous faites d\195\169filer la page vers le bas."])
let monday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Monday"])
| Fr -> (fun  () -> String.concat "" ["Lundi"])
let tuesday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Tuesday"])
| Fr -> (fun  () -> String.concat "" ["Mardi"])
let wednesday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Wednesday"])
| Fr -> (fun  () -> String.concat "" ["Mercredi"])
let thursday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Thursday"])
| Fr -> (fun  () -> String.concat "" ["Jeudi"])
let friday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Friday"])
| Fr -> (fun  () -> String.concat "" ["Vendredi"])
let saturday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Saturday"])
| Fr -> (fun  () -> String.concat "" ["Samedi"])
let sunday ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Sunday"])
| Fr -> (fun  () -> String.concat "" ["Dimanche"])
let demo_carousel_wheel ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Wheel carousel"])
| Fr -> (fun  () -> String.concat "" ["Carousel avec roulette"])
let demo_carousel_third_example_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Example of a vertical circular carousel (wheel). Try with a touch screen."])
| Fr -> (fun  () -> String.concat "" ["Exemple de carousel vertical circulaire (wheel). Essayez avec un \195\169cran tactile."])
let demo_notification ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Notifications"])
| Fr -> (fun  () -> String.concat "" ["Notifications"])
let demo_notification_got ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["got"])
| Fr -> (fun  () -> String.concat "" ["Re\195\167u"])
let exchange_msg_between_users ?(lang = get_language ()) () =
match lang with
| En -> (fun ~os_notif () -> String.concat "" ["Module ";os_notif;" enables sending information to client applications (notifications, new messages ...)."])
| Fr -> (fun ~os_notif () -> String.concat "" ["Le module ";os_notif;" permet des donn\195\169es aux applications client (notifications, nouveaux messages,...)."])
let open_multiple_tabs_browsers ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Open this page in multiple tabs or browsers."])
| Fr -> (fun  () -> String.concat "" ["Ouvrez cette page dans plusieurs onglets et fen\195\170tres."])
let fill_input_form_send_message ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Fill in the input form to send a message to all other tabs."])
| Fr -> (fun  () -> String.concat "" ["Remplissez le formulaire pour envoyer un message \195\160 tous vos autres onglets ouverts."])
let send_message ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["send message"])
| Fr -> (fun  () -> String.concat "" ["envoyer le message"])
let demo_pgocaml ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Database request"])
| Fr -> (fun  () -> String.concat "" ["Requ\195\170te \195\160 la base de donn\195\169es."])
let no_user_create_accounts ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["No user. Create some accounts to test."])
| Fr -> (fun  () -> String.concat "" ["Aucun utilisateur. Cr\195\169ez quelques comptes pour tester."])
let demo_pgocaml_users ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Users:"])
| Fr -> (fun  () -> String.concat "" ["Utilisateurs\194\160:"])
let demo_pgocaml_description_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This page shows signed-up users fetched from the database."])
| Fr -> (fun  () -> String.concat "" ["Cette page montre tous les utilisateurs inscrits qui ont \195\169t\195\169 r\195\169cup\195\169r\195\169s de la base de donn\195\169es."])
let demo_pgocaml_description_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Have a look at the source code to see how to make a DB request with PGOCaml."])
| Fr -> (fun  () -> String.concat "" ["Regardez dans le code source comment r\195\169aliser une requ\195\170te \195\160 la base de donn\195\169es en utilisant PGOcaml."])
let demo_pgocaml_description_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["We are using Ot_spinner to display the list, which means that, in the case the page is generated client-side, the page will be displayed immediately with a spinner, that will be replaced by the contents when ready. The code contains a 2s sleep to demonstrate the spinner."])
| Fr -> (fun  () -> String.concat "" ["Nous utilisons Ot_spinner pour afficher la liste\194\160: dans le cas o\195\185 une page est g\195\169n\195\169r\195\169e c\195\180t\195\169 client, cette page est affich\195\169e imm\195\169diatement avec une ic\195\180ne de chargement qui sera remplac\195\169e par le contenu quand il sera pr\195\170t. Pour la d\195\169monstration, nous avons ajout\195\169 une pause de 2s pour laisser le temps de voir l'ic\195\180ne de chargement."])
let demo_popup ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Popup Button"])
| Fr -> (fun  () -> String.concat "" ["Bouton popup"])
let demo_popup_click ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Click for a popup!"])
| Fr -> (fun  () -> String.concat "" ["Cliquez pour afficher un popup\194\160!"])
let demo_popup_message ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Popup message"])
| Fr -> (fun  () -> String.concat "" ["Message du popup"])
let demo_popup_content ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Here is a button showing a simple popup window when clicked:"])
| Fr -> (fun  () -> String.concat "" ["Voici un bouton affichant une simple fen\195\170tre popup quand vous cliquez dessus\194\160:"])
let demo_reactive_programming ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Reactive pages"])
| Fr -> (fun  () -> String.concat "" ["Pages r\195\169actives"])
let demo_reactive_programming_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This is an example of a page with reactive content. It is a very convenient solution to update pages when data changes."])
| Fr -> (fun  () -> String.concat "" ["Ceci est un exemple d'une page avec du contenu r\195\169actif. C'est une solution extr\195\170ment simple pour mettre \195\160 jour une page quand les donn\195\169es changent."])
let demo_reactive_programming_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["It defines a (client-side) reactive OCaml list. You can add elements in this list via the input form. The page is updated automatically when the value of the reactive list changes."])
| Fr -> (fun  () -> String.concat "" ["Il d\195\169finit une liste OCaml r\195\169active (c\195\180t\195\169 client). Vous pouvez ajouter des \195\169lements dans cette liste via le formulaire. Cette page sera automatique mise \195\160 jour quand la valeur de la liste r\195\169active changera."])
let demo_reactive_programming_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["The reactive page is generated either server-side (for example when you are using a Web browser and you reload this page) or client-side (in a mobile app or if you were already in the app before coming to this page)."])
| Fr -> (fun  () -> String.concat "" ["La page r\195\169active est g\195\169n\195\169r\195\169e aussi bien du c\195\180t\195\169 serveur (par exemple quand vous utilisez le navigateur web et que vous rechargez cette page) que du c\195\180t\195\169 client (sur mobile ou si vous \195\169tiez d\195\169j\195\160 sur dans cette application avant de venir sur cette page)."])
let demo_eliom_ref ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Eliom references + OS dates"])
| Fr -> (fun  () -> String.concat "" ["R\195\169f\195\169rences Eliom + dates OS"])
let demo_eliom_ref_first_visit ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This is your first visit."])
| Fr -> (fun  () -> String.concat "" ["Ceci est votre premi\195\168re visite."])
let demo_eliom_ref_last_visit ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["The last time you visited was: "])
| Fr -> (fun  () -> String.concat "" [" La derni\195\168re fois que vous avez visit\195\169 ce lien \195\169tait\194\160:"])
let demo_eliom_ref_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["We use an Eliom reference to record the last time you visited this page. Eliom references make it possible to save, server-side, data specific to one user, one browser, or one tab. "])
| Fr -> (fun  () -> String.concat "" ["Nous utilisons les r\195\169f\195\169rences Eliom pour sauvegarder la date de la derni\195\168re fois que vous avez visit\195\169 cette page. Les r\195\169f\195\169rences Eliom permettent de sauvegarder c\195\180t\195\169 serveur des donn\195\169es propres \195\160 un utilisateur, \195\160 un navigateur ou \195\160 un onglet."])
let demo_eliom_ref_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["The value is different for each user."])
| Fr -> (fun  () -> String.concat "" ["La valeur est diff\195\169rente pour chaque utilisateur."])
let demo_eliom_ref_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["The reference has been updated. Come back later!"])
| Fr -> (fun  () -> String.concat "" ["La r\195\169f\195\169rence a \195\169t\195\169 mise \195\160 jour. Revenez plus tard\194\160!"])
let demo_rpc_button ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["RPC button"])
| Fr -> (fun  () -> String.concat "" ["Bouton RPC"])
let demo_rpc_button_click_increase ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Click to increase server-side value"])
| Fr -> (fun  () -> String.concat "" ["Cliquez pour augmenter la valeur c\195\180t\195\169 serveur."])
let demo_rpc_button_description ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This button performs an RPC to increase a server-side value."])
| Fr -> (fun  () -> String.concat "" ["Ce bouton r\195\169alise un appel de fonction distante (RPC) pour augmenter une valeur c\195\180t\195\169 serveur."])
let demo_spinner ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Spinner"])
| Fr -> (fun  () -> String.concat "" ["Ic\195\180ne de chargement"])
let demo_spinner_content_ready ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["The content is ready. "])
| Fr -> (fun  () -> String.concat "" ["Le contenu est pr\195\170t."])
let demo_spinner_message_replace_spinner ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This message has replaced the spinner."])
| Fr -> (fun  () -> String.concat "" ["Ce message a remplac\195\169 l'ic\195\180ne de chargement."])
let demo_spinner_description_ot ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This is a demo of the Ocsigen Toolkit spinner widget."])
| Fr -> (fun  () -> String.concat "" ["Ceci est la d\195\169monstration de l'ic\195\180ne de chargement d'Ocsigen Toolkit."])
let demo_spinner_description_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["We use this widget to integrate into the page an HTML block that takes a long time to produce, e.g., because of a slow server call."])
| Fr -> (fun  () -> String.concat "" ["Nous utilisons ce widget pour int\195\169grer dans notre page HTML un bloc qui prend un long moment \195\160 produire, par exemple, \195\160 cause d'un appel serveur lent."])
let demo_spinner_description_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["A spinner is displayed, which is then replaced with the actual content when this content is ready."])
| Fr -> (fun  () -> String.concat "" ["Une ic\195\180ne de chargement est d'abord affich\195\169e, puis remplac\195\169e par le vrai contenu quand celui-ci est pr\195\170t."])
let demo_spinner_description_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["For the demo we just sleep for 5 seconds to simulate waiting for the content."])
| Fr -> (fun  () -> String.concat "" ["Pour la d\195\169monstration, nous avons ajout\195\169 un d\195\169lai de 5 secondes pour simuler l'attente du contenu."])
let demo_spinner_generated_client_side ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["The spinner is generated client-side."])
| Fr -> (fun  () -> String.concat "" ["L'ic\195\180ne de chargement est g\195\169n\195\169r\195\169e c\195\180t\195\169 client."])
let demo_timepicker ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Time picker"])
| Fr -> (fun  () -> String.concat "" ["S\195\169lecteur d'heure"])
let demo_timepicker_back_to_hours ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Back to hours"])
| Fr -> (fun  () -> String.concat "" ["Revenir aux heures"])
let demo_timepicker_description ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This page shows the Ocsigen Toolkit's time picker."])
| Fr -> (fun  () -> String.concat "" ["Cette page montre le s\195\169lecteur d'heure d'Ocsigen Toolkit."])
let demo_tips ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Tips"])
| Fr -> (fun  () -> String.concat "" ["Astuces"])
let change_profile_picture ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Change profile picture"])
| Fr -> (fun  () -> String.concat "" ["Changer votre photo de profil."])
let demo_widget_ot ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This app also contains demos for some widgets from Ocsigen Toolkit."])
| Fr -> (fun  () -> String.concat "" ["Cette application contient \195\169galement des d\195\169monstrations de quelques widgets d'Ocsigen Toolkit."])
let demo_widget_see_drawer ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["The different demos are accessible through the drawer menu. To open it click the top left button on the screen."])
| Fr -> (fun  () -> String.concat "" ["Les diff\195\169rentes d\195\169monstrations sont accessibles \195\160 travers le menu. Pour l'ouvrir, cliquez sur le bouton en haut \195\160 gauche de l'\195\169cran."])
let demo_widget_feel_free ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Feel free to modify the generated code and use it or redistribute it as you want."])
| Fr -> (fun  () -> String.concat "" ["Vous \195\170tes libres de modifier le code g\195\169n\195\169r\195\169 et de l'utiliser ou de le redistribuer comme vous souhaitez."])
let users ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Users"])
| Fr -> (fun  () -> String.concat "" ["Utilisateurs"])
let you_are_not_connected ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["You are not connected."])
| Fr -> (fun  () -> String.concat "" ["Vous n'\195\170tes pas connect\195\169."])
let you_are ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["You are"])
| Fr -> (fun  () -> String.concat "" ["Vous \195\170tes"])
let log_in_to_see_demo ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Log in to see the demo."])
| Fr -> (fun  () -> String.concat "" ["Connectez-vous pour voir la d\195\169monstration."])
let your_user_id ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Your user id"])
| Fr -> (fun  () -> String.concat "" ["Votre ID utilisateur"])
let the_module ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["The module"])
| Fr -> (fun  () -> String.concat "" ["Le module"])
let allows_get_information_currently_connected_user ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["provides information about the currently connected user (server or client side)."])
| Fr -> (fun  () -> String.concat "" ["vous autorise \195\160 obtenir les information de l'utilisateur courant connect\195\169 (c\195\180t\195\169 serveur ou c\195\180t\195\169 client)."])
let these_functions_called_server_or_client_side ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["These functions can be called from either server- or client-side."])
| Fr -> (fun  () -> String.concat "" ["Ces fonctions peuvent \195\170tre appel\195\169es aussi bien c\195\180t\195\169 client que c\195\180t\195\169 serveur."])
let always_get_current_user_using_module ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Always get the current user id using module"])
| Fr -> (fun  () -> String.concat "" ["R\195\169cup\195\169rez toujours l'ID de l'utilisateur courant en utilisant le module"])
let never_trust_client_pending_user_id ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Never trust a client sending its own user id!"])
| Fr -> (fun  () -> String.concat "" ["Ne faites jamais confiance \195\160 un client envoyant son propre ID d'utilisateur\194\160!"])
let internationalization ?(lang = get_language ()) () =
match lang with
| En -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "I" else "i");"nternationalization"])
| Fr -> (fun ?(capitalize=false) () -> String.concat "" [(if capitalize then "I" else "i");"nternationalisation"])
let internationalization_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Ocsigen Start uses Ocsigen-i18n for internationalizing your app. Ocsigen-i18n defines a PPX syntax extension for automatically selecting language-dependent text for each user. The user can choose his preferred language from the settings page. By default the browser's language is used."])
| Fr -> (fun  () -> String.concat "" ["Ocsigen Start utilise Ocsigen-i18n for internationaliser les applications. Ocsigen-i18n d\195\169finit une extension de syntaxe PPX qui s\195\169lectionne automatiquement les textes en fonction de la langue de l'utilisateur courant. L'utilisateur peut choisir sa langue pr\195\169f\195\169r\195\169e dans la page de param\195\168tres. Par d\195\169faut, la langue du navigateur est utilis\195\169e."])
let internationalization_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~f1 ~f2 () -> String.concat "" ["Write your translations (as tab-separated-values) in file ";f1;". File ";f2;" is generated automatically from this file."])
| Fr -> (fun ~f1 ~f2 () -> String.concat "" ["\195\137crivez vos traductions (au format \"tab-separated-values\") dans le fichier ";f1;". Le fichier ";f2;" est g\195\169n\195\169r\195\169 automatiquement \195\160 partir de ce fichier."])
let internationalization_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Have a look at the OCaml code of this page to discover some features of the module Ocsigen-i18n."])
| Fr -> (fun  () -> String.concat "" ["Jetez un coup d'\197\147il au code OCaml de cette page pour d\195\169couvrir quelques astuces du module Ocsigen-i18n."])
let links_and_static_files ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Links, services and static files"])
| Fr -> (fun  () -> String.concat "" ["Liens, services et fichiers statiques"])
let services ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Services"])
| Fr -> (fun  () -> String.concat "" ["Services"])
let services_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~f1 ~f2 ~f3 () -> String.concat "" ["Have a look at file ";f1;" to see some examples of service definitions. Most service handlers are defined in file ";f2;". Service registration is done in ";f3;". Have a look to see how to define a service returning an application page, an action or a redirection, etc. Read Ocsigen's tutorials and Eliom's manual for more information about services."])
| Fr -> (fun ~f1 ~f2 ~f3 () -> String.concat "" ["Vous trouverez des exemples de d\195\169finition de services dans le fichier ";f1;". La plupart des handlers de services sont d\195\169finis dans le fichier ";f2;". L'enregistrement des services est fait dans le fichier ";f3;". Jetez-y un \197\147il pour voir comment d\195\169finir une nouvelle page pour cette application, une action, une redirection, etc. Lisez les tutoriels d'Ocsigen et le manuel d'Eliom pour plus d'informations sur les services."])
let links_and_forms ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Links and forms"])
| Fr -> (fun  () -> String.concat "" ["Liens et formulaires"])
let links_and_forms_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~t1 ~t2 () -> String.concat "" ["Here is an example of an ";t1;", and an example of link towards an ";t2;"."])
| Fr -> (fun ~t1 ~t2 () -> String.concat "" ["Voici un exemple de ";t1;", et un exemple de lien vers un ";t2;"."])
let internal_link ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["internal link"])
| Fr -> (fun  () -> String.concat "" ["lien interne"])
let external_service ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["external service"])
| Fr -> (fun  () -> String.concat "" ["service externe"])
let static_files ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Static files"])
| Fr -> (fun  () -> String.concat "" ["Fichiers statiques"])
let static_files_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~static ~static_dir () -> String.concat "" ["Use service ";static_dir;" (predefined in Eliom) to create links towards static files (images, fonts, etc.). Put static files you want to include in the mobile app in directory ";static;". They will be stored locally on the mobile device. By default, links are relative on the Web app and absolute on the mobile app. For example, here is an example of an image stored locally in the mobile app:"])
| Fr -> (fun ~static ~static_dir () -> String.concat "" ["Utilisez le service ";static_dir;" (pr\195\169d\195\169fini dans Eliom) pour faire des liens vers des fichiers statiques (images, fontes, etc.). Les fichiers statiques que vous voulez inclure dans l'application mobile doivent \195\170tre plac\195\169s dans le r\195\169pertoire ";static;". Ils seront stock\195\169s en local sur l'appareil mobile. Par d\195\169faut les liens sont relatifs dans l'application Web et absolus dans l'application mobile. Forcez les liens relatifs pour faire des liens vers des fichiers locaux dans l'application mobile. Par exemple voici une image stock\195\169e localement dans l'application mobile\194\160:"])
let static_files_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["and a remote image:"])
| Fr -> (fun  () -> String.concat "" ["et une image distante\194\160:"])
let change_language ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Change language"])
| Fr -> (fun  () -> String.concat "" ["Changer la langue"])
let tips1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Tips for new users and new features"])
| Fr -> (fun  () -> String.concat "" ["Astuces pour les nouveaux utilisateurs et nouvelles fonctionnalit\195\169s"])
let tips2 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~os_tips () -> String.concat "" ["Module ";os_tips;" implements a way to display tips in the page to the users who haven't already seen them."])
| Fr -> (fun ~os_tips () -> String.concat "" ["Le module ";os_tips;" impl\195\169mente une fa\195\167on d'afficher des astuces dans la page aux utilisateurs qui ne les ont pas d\195\169j\195\160 vues."])
let tips3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["This page contains a tip, that you will see only as connected user, until you close it."])
| Fr -> (fun  () -> String.concat "" ["Cette page contient une astuce, que vous allez voir seulement en tant qu'utilisateur connect\195\169, jusqu'\195\160 ce que vous la fermiez."])
let tips4 ?(lang = get_language ()) () =
match lang with
| En -> (fun ~set_page () -> String.concat "" ["It is possible to reset the set of already seen tips from the ";set_page;"."])
| Fr -> (fun ~set_page () -> String.concat "" ["Il est possible de r\195\169initialiser l'ensemble des astuces d\195\169j\195\160 vues depuis la page ";set_page;"."])
let tips5 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["settings page"])
| Fr -> (fun  () -> String.concat "" ["page Param\195\168tres"])
let demo_intro ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Demo: introduction"])
| Fr -> (fun  () -> String.concat "" ["Demo\194\160: introduction"])
let general_principles ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["General principles"])
| Fr -> (fun  () -> String.concat "" ["Principes g\195\169n\195\169raux"])
let demo_intro_1 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Ocsigen provides a set of largely independent tools for implementing Web and mobile applications (OCaml to JS compiler, Web server, typed HTML, etc.). Ocsigen can be used to implement, depending on your needs, either traditional Web sites (server-side), or client-side apps running in a browser, or full client-server apps, running both in a browser and as mobile apps. Ocsigen Start is a template for quickly writing such a client-server app."])
| Fr -> (fun  () -> String.concat "" ["Ocsigen fournit un ensemble d'outils largement ind\195\169pendants pour programmer des applications Web et mobiles (compilateur OCaml vers Javascript, serveur Web, HTML typ\195\169, etc.). Cela vous permet d'\195\169crire, selon vos besoins, des sites Web traditionnels (c\195\180t\195\169 serveur), des applications clientes s'ex\195\169cutant dans une page Web, ou de v\195\169ritables applications client-serveur, pouvant s'ex\195\169cuter dans un navigateur ou comme application mobile. Ocsigen Start est un template pr\195\170t \195\160 utiliser pour ce type d'applications client-serveur."])
let demo_intro_2 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Ocsigen Eliom is a set of libraries for Web programming in OCaml: sessions, services, client-server communication, etc. It also contains an extension of the OCaml language to write a client-server program as a single app. Code annotations permit distinguishing between the code to be included in the server app, the code for the client app, and the code to be included in both of them. Have a look at the code of this app to learn how to generate typed HTML pages, how to call server function from client side, or how to send information to client applications (notifications)."])
| Fr -> (fun  () -> String.concat "" ["Ocsigen Eliom est un ensemble de biblioth\195\168ques pour la programmation Web en OCaml : sessions, services, communication client-serveur, etc. Il contient aussi une extension du langage OCaml permettant d'\195\169crire des applications client-serveur. Des annotations du code permettent de distinguer le code devant \195\170tre inclus dans l'application serveur, du code qui doit \195\170tre inclus dans l'application cliente. Regardez le code source de cette application pour apprendre comment g\195\169n\195\169rer des pages HTML bien typ\195\169es, comment appeler une fonction serveur depuis un programme client, ou encore comment envoyer des informations aux clients connect\195\169s (notifications)."])
let demo_intro_3 ?(lang = get_language ()) () =
match lang with
| En -> (fun  () -> String.concat "" ["Read tutorials on Ocsigen's Web site for a more detailed introduction."])
| Fr -> (fun  () -> String.concat "" ["Lisez les tutoriels du site d'Ocsigen pour une introduction plus d\195\169taill\195\169e."])
end
end
]
