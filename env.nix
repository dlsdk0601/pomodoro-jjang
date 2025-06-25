let
    pkgs = import <nixpkgs> { };
    stablePkgs = import (fetchTarball {
        # 25.05 @ 25.06.02 https://github.com/NixOS/nixpkgs/tree/7282cb574e0607e65224d33be8241eae7cfe0979
        url = "https://github.com/NixOS/nixpkgs/tarball/7282cb574e0607e65224d33be8241eae7cfe0979";
        sha256 = "0klkpy7ah033y3cwj51a0l96lwmkqqvwgfv3kid4z9x5g2rqr0l5";
    }) { };

    packagesApp =
        (pkgs.lib.optionals pkgs.stdenv.isDarwin [
            stablePkgs.cocoapods
        ])
        ++ [
            stablePkgs.fvm # 3.2.1
        ];

    packages = packagesApp;
in
{ name }:
pkgs.mkShellNoCC {
    name = "pomodoro-jjang-${name}";

    inherit packages;

    shellHook = '''';
}
