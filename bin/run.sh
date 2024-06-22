#! /bin/sh

deft new application --simple hello-world
cd hello-world
deft build --all
_build/bin/hello-world