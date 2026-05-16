#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container, enable extra repos and install packages
dnf update -y
dnf copr enable dejan/lazygit -y
dnf group install development-tools -y
dnf group install c-development -y
grep -v '^#' ./devbox-default.packages | xargs dnf install -y --skip-unavailable
grep -v '^#' ./devbox-rust.packages | xargs dnf install -y --skip-unavailable
