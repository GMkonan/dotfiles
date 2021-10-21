#!/bin/bash

# source scripts for using functions
for shell_script in "./scripts/"*.sh; do
  source "${shell_script}"
done

echo "creating symlinks"

create_symlinks

