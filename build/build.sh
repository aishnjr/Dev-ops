#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Compile the source code
echo "Compiling the source code..."
gcc -o my_program main.c

# Run tests
echo "Running tests..."
./run_tests.sh

# Package the compiled binary
echo "Packaging the build..."
tar -czvf my_program.tar.gz my_program

echo "Build completed successfully!"