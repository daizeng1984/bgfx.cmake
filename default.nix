# { pkgs ? import <nixpkgs> {} }:
{ pkgs ? 
import (builtins.fetchTarball {
      name = "nixos-20.09";
      url = "https://codeload.github.com/NixOS/nixpkgs/tar.gz/20.09";
      sha256 = "1wg61h4gndm3vcprdcg7rc4s1v3jkm5xd7lw8r2f67w502y94gcy";
  }) {}
}:

let
  version = "0.1";
in pkgs.mkShell {
  name = "bgfx";
  src = "./.";

  nativeBuildInputs = with pkgs; [ 
  ];
  # phases: unpackPhase -> configurePhase -> buildPhase -> installPhase
  buildInputs = with pkgs; [ 
    cmake 
    ninja 
    libGLU
  ]
  ++ lib.optionals stdenv.isLinux [ xlibs.libX11 ]
  ++ lib.optionals stdenv.isDarwin [ OpenGL ]
  ;

  enableParallelBuilding = true;
}

