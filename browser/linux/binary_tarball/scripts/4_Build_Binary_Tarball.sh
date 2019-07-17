#!/bin/sh

SOURCE_FOLDER=$1;
OUTPUT_TARBALL=$2;

printf "\n\n--------------------------------------- BUILD -----------------------------------------------\n";

# Bootstraps librewolf again (using the ./mach script inside the source code)
# printf "\nRunning bootstrapper to install build dependencies (using ./mach script within source code)\n";
# ./mach bootstrap --application-choice=browser --no-interactive;

cd $SOURCE_FOLDER;

printf "\nBuilding LibreWolf\n";
./mach build;

printf "\nPackaging LibreWolf\n";
./mach package;

printf "\nMoving Binary Tarball to output location\n";
mv ./obj*/dist/librewolf*.tar.bz2 $OUTPUT_TARBALL;

printf "\nDeleting the compile_folder\n";
rm -rf ./;
