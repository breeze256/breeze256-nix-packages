# Breeze256's NUR Repository

Just my personal NUR repository lol

## Available packages

- [gruvbox-material-gtk](./pkgs/gruvbox-material-gtk/default.nix)

## How to add the repository

1. Add this to your inputs:
```nix
inputs = {
  # ...
  breeze256-NUR = {
    url = "github:breeze256/breeze256-nix-packages";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  # ...
};
```
Or, if you are in China, add this:
```nix
inputs = {
  # ...
  breeze256-NUR = {
    url = "git+https://mirror.ghproxy.com/https://github.com/breeze256/breeze256-nix-packages";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  # ...
};
```

2. add this to your outputs:
```nix
outputs = { self, nixpkgs, ... }@inputs: {
  nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      # Add below
      ({
        nixpkgs.overlays = [
          (final: prev: {
            breeze256-NUR = inputs.breeze256-NUR.packages."${prev.system}";
          })
        ];
      })
      # Add above

      ./configuration.nix
    ];
  };
};
```

3. Install packages like `pkgs.breeze256-NUR.$somepackage`