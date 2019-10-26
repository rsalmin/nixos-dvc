# nixos-dvc
shell script to start DVC (data version control) under nixos

for nixos 19.03

dvc version 1.65.0

### use

```sh
$ nix-shell dvc-shell.nix
```

### issues

dvc trying to start daemon after almost each command, wich is failed due
to argv[0] is a shell script not python.

