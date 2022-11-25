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
