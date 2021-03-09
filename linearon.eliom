[%%shared
open Eliom_lib
open Eliom_content
open Html.D
open Eliom_parameter
]

open Parse_proof_string

module Linearon_app =
  Eliom_registration.App (
  struct
    let application_name = "linearon"
    let global_data_path = None
  end)

(* Service declaration *)
let parse_proof_string_service =
  Eliom_service.create
    ~path:(Eliom_service.Path ["parse_proof_string"])
    ~meth:(Eliom_service.Get (Eliom_parameter.string "proofAsString"))
    ()

(* Service definition *)
let _ =
  Eliom_registration.String.register
    ~service:parse_proof_string_service
    (fun proof_as_string () ->
      let success, result = safe_parse proof_as_string in
        let response =
            if success then "{\"is_valid\": true, \"proof_as_json\": " ^ result ^ "}"
            else "{\"is_valid\": false, \"error_message\": \"" ^ result ^ "\"}" in
        Lwt.return (response, "application/json"));;

