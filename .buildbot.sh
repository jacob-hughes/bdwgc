#!/bin/sh
#
# Build script for continuous integration.

set -e
mkdir static && cd static
cmake -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=OFF -Denable_parallel_mark=ON -Dbuild_tests=ON -Denable_gc_assertions=ON ../
make -j
ctest

cd ..
mkdir dynamic && cd dynamic
cmake -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=ON -Denable_parallel_mark=OFF -Dbuild_tests=ON -Denable_gc_assertions=ON ../
make -j
ctest
