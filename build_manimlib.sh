#!/bin/bash

# This script will rebuild manim to be used with pyodide. It should be called
# from inside the pyodide docker image (i.e. after running ./run_docker).

# update the build
rm -rf packages/manimlib/build/

# # rebuild the tarball
# cd /manim
# rm -rf dist
# python setup.py sdist

bin/pyodide buildpkg --package_abi 1 packages/manimlib/meta.yaml

# copy into build dir
cp packages/manimlib/build/manimlib.js build
cp packages/manimlib/build/manimlib.data build
