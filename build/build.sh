#!/bin/bash

# build.sh - Script to compile and package the application

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
BUILD_DIR="build"
ARTIFACT="my_app.jar"
SOURCE_DIR="src"

# Clean previous build artifacts
echo "Cleaning up previous build..."
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

# Compile the source code (assuming a Java project here)
echo "Compiling the source code..."
javac -d $BUILD_DIR $SOURCE_DIR/*.java

# Package the compiled code into a JAR file
echo "Packaging the build..."
jar cf $BUILD_DIR/$ARTIFACT -C $BUILD_DIR .

echo "Build completed successfully!"
