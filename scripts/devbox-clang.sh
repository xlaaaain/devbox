#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container, enable extra repos and install packages
dnf update -y
dnf copr enable dejan/lazygit -y
dnf group install development-tools -y
dnf install dnf5-plugins -y
dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo -y
dnf install gh --repo gh-cli -y
grep -v '^#' ./devbox-default.packages | xargs dnf install -y --skip-unavailable
grep -v '^#' ./devbox-clang.packages | xargs dnf install -y --skip-unavailable
