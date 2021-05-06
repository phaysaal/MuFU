let () =
  let file =
    match MuFU.Options.parse() with
    | Some (`File file) -> file
    | Some `Stdin ->
        let tmp_file = Filename.temp_file "stdin-" ".in" in
        let contents = MuFU_util.In_channel.(input_all stdin) in
        MuFU_util.Out_channel.with_file tmp_file ~f:begin fun ch ->
          MuFU_util.Out_channel.output_string ch contents
        end;
        tmp_file
    | None -> exit 1
  in
    begin match MuFU.main file with
    | () ->
        print_string "OK"
    ;exit 1
    end;
