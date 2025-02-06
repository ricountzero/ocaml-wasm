open Js_of_ocaml

let draw_triangle () =
  let canvas = Dom_html.getElementById "canvas" |> Js.Opt.to_option |> Option.get in
  let ctx = canvas##getContext (Js.string "2d") |> Js.Opt.get_exn in
  ctx##beginPath;
  ctx##moveTo (100., 100.);
  ctx##lineTo (200., 100.);
  ctx##lineTo (150., 50.);
  ctx##closePath;
  ctx##setFillStyle (Js.string "red");
  ctx##fill ();

let () =
  Js_of_ocaml.Dom_html.window##.onload := Dom_html.Handler.make (fun _ ->
    draw_triangle ();
    Js._true
  )
