# nixos-dvc
nix-shell script to start DVC (data version control) under nixos
and script for tensorflow-datasets

for NixOS 19.09

DVC version 1.65.0

### use

```sh
$ nix-shell dvc-shell.nix
```

or

```sh
$ nix-shell tensorflow-datasets-shell.nix
```
### issues

DVC trying to start the daemon to collect usage analytics by default, which is failed due to argv[0] is a shell script (not a python). Therefore you will get a bunch of text with the description of Syntax error,
after running almost any DVC command.

use
```sh
dvc config --global core.analytics false
```
to disable analytics collection. (You will still experience Syntax error at the end of the command if you run DVC out of DVC repository)
