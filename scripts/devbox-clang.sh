#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container, enable extra repos and install packages
dnf update -y
dnf copr enable dejan/lazygit
grep -v '^#' ./devbox-clang.packages | xargs dnf install -y
