<?php
    function output_json($data){
      header("Access-Control-Allow-Origin: *");
      header('Content-Type: application/json; charset=utf-8');
      echo json_encode($data);
  }

    return output_json([
            [
              "id" => 1,
              "nama" => "Senang"
            ],
            [
              "id" => 2,
              "nama" => "Sedih"
            ],
            [
              "id" => 3,
              "nama" => "Menangis",
            ]
        ]
    );