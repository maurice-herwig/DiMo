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


Docker
===========
The build process to create a Docker image from DiMo is a little more complex than the standard build process of a
Docker image. The reason for this is that to build a .native or .build file, ocaml needs a runtime environment and we
only have this in a running container and not in the build process itself.

The following is a detailed description of the entire build process.

First, we need to create the docker image with all the necessary dependencies. For this we can use the command in the
root path of this project.

```
docker build -t dimo-step-1 .
```

After the build, we need to run the container in the interactive and pseudo-TTY mode with the following command.

```
docker run --name dimo-container -it dimo-step-1
```

Now we can create in the current running container the .native file and/or the .byte file. To build the dimo.native file
we can use:

```
ocaml setup.ml -configure
ocaml setup.ml -build         
```

and to build the dimo.byte file.

```
ocaml setup.ml -configure --override is_native false
ocaml setup.ml -build    
```

To leave the interactive and pseudo-TTY mode we can use the `exit` command.

At the very least, we need to create a snapshot of the dimo container as a new image, for which we can use the command.

```
docker commit dimo-container dimo:latest
```
Now we can use this docker container to run the .native or .byte file inside the container, or use this image as a base image for a backend that uses the dimo functionality.
 
