# Set the base image wicht based on a ubuntu 22.04 system already installed with ocaml-4.08.
FROM ocaml/opam:ubuntu-22.04-ocaml-4.08

# Set the current user as root user, to have all permisions.
USER root

# Install dependencies and nodejs with npm
RUN apt-get update -y && \
    apt-get install oasis -y && \
    apt-get install -y libgmp-ocaml-dev && \
    apt-get install -y libgmp-dev python3 && \
    apt-get install nodejs -y && \
    apt install npm -y

# Set the user back to the default opam user.
USER opam

# Init opam
RUN sudo ln -f /usr/bin/opam-2.0 /usr/bin/opam && opam init --reinit -n

# Install ocamlbuild and ocamlfind
RUN opam install ocamlbuild.0.14.2 -y && \
    opam install ocamlfind.1.9.5  -y && \
    eval $(opam env)

# Install opam packages
RUN opam install dune.3.6.1 &&  \
    opam install conf-python-3.1.0.0 && \
    opam install conf-gmp.4 && \
    opam install conf-C++.1.0 && \
    opam install minisat.0.4 && \
    opam install zarith.1.12 && \
    opam install z3.4.11.2 &&\
    opam install ocaml-sat-solvers.0.7.1 && \
    opam install oasis.0.4.11 && \
    eval $(opam env)

# Set the wordkir
WORKDIR /home/opam/dimo

# Add files
ADD . .

# Create the setup.ml file
RUN oasis setup
