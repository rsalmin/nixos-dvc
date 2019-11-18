# nixos-for-ds
nix-shell scripts to start:
* DVC (data version control) 1.68.1
* tensorflow-datasets
* tensorflow 2.0.0 (CPU/GPU without tensorboard)

for NixOS 19.09

### use

```sh
$ nix-shell dvc-shell.nix
```

or

```sh
$ nix-shell tensorflow-datasets-shell.nix
```

or

```sh
$ nix-shell tensorflow-shell.nix
```

### Issues

DVC trying to start the daemon to collect usage analytics by default, which is failed due to argv[0] is a shell script (not a python). Therefore you will get a bunch of text with the description of Syntax error, after running almost any DVC command. Setting core.analytics flag to false as written in the documentation didn't help, therefore shell script sets environment variable DVC_DAEMON=1 to deceive DVC that daemon is already running.
