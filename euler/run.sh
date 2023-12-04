#!/usr/bin/env bash

# Running Benchmarks with logging

# Set the path to the benchmark
BIN_PATH="dist-newstyle/build/x86_64-osx/ghc-9.6.1/epsilon-0.1.0.0/x/epsilon/build/epsilon/epsilon"

$BIN_PATH | tee BENCHMARKS
