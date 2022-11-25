# DiMo
A Tool for Discrete Modelling Using Propositional Logic


Installation
============

1. Install and initialize opam, see https://opam.ocaml.org/

2. Issue the following commands in order to obtain all necessary packages and the right OCaml compiler.

```
opam switch 4.08.0
eval `opam config env` 
opam install ocamlbuild ocamlfind ocaml-sat-solvers
```

If you get on Ubuntu the error message  `the following action failed build conf-gmp 4 `. Run the following
lines of code and try to install ocaml-sat-solvers agan. 
```
sudo apt-get update -y
sudo apt-get install -y libgmp-ocaml-dev
```

3. To build a native-code version of the discrete modelling tool, issue the following commands.

```
ocaml setup.ml -configure
ocaml setup.ml -build         
```

Optional to build a byte-code version of the discrete modelling tool, issue the following commands.

```
ocaml setup.ml -configure --override is_native false
ocaml setup.ml -build    
```

Running
=======

Issue

```
dimo.byte -h
```

respectively

```
dimo.native -h
```

to see info on the use via the command line.
