# devbox

## What is devbox ?

devbox is a collection of container images to be used with distrobox/toolbox to have a "batteries included" development environment for different kinds of workflows, using neovim as the editor, for use on immutable operating systems such as bazzite.

## What images are available?

Currently available:

- `devbox-clang` C/C++
- `devbox-rust` Rust
- `devbox-csharp` C#

All images have neovim with the required utilities to use [LazyVim](https://github.com/LazyVim/LazyVim).

The following are planned for the near future:

- `devbox-cuda` for CUDA workflows
- `devbox-golang` for go
- `devbox-godot` for developing games on the godot engine
- `devbox-unity` for unity stuff
- `devbox-unityvrc` for working with VRChat
- `devbox-webdev` for everything web developers need
- potentially many more!

All images will have a base set of utilities installed including neovim and the required utilities for LazyVim.

## Using the devbox images

If you use distrobox:

    distrobox create -i ghcr.io/xlaaaain/devbox-clang -n devbox-clang
    distrobox enter devbox-clang

If you need nvidia gpu support in the container:

    distrobox create -i ghcr.io/xlaaaain/devbox-clang --nvidia -n devbox-clang
    distrobox enter devbox-clang

    
If you use toolbox:

    toolbox create -i ghcr.io/xlaaaain/devbox-clang -c devbox-clang
    toolbox enter devbox-clang

**NOTE:**

- You can use `chezmoi` to pull down your dotfiles and set up git sync.

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/quickstart/quickstart-cosign/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/xlaaaain/devbox
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/key_management/signing_with_self-managed_keys/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.
