{ pkgs }: {
    deps = [
        pkgs.imagemagick6_light
        pkgs.run
        pkgs.haskellPackages.quickcheck-script
        (pkgs.haskellPackages.ghcWithPackages (pkgs: [
            # Put your dependencies here!
        ]))
        pkgs.haskell-language-server
        pkgs.cabal-install
    ];
}