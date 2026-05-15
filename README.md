# devbox

## What is devbox ?

devbox is a collection of container images to be used with distrobox/toolbox to have a "batteries included" development environment for different kinds of workflows, using neovim as the editor, for use on immutable operating systems such as bazzite.

## Using the devbox images

If you use distrobox:

    distrobox create -i ghcr.io/xlaaaain/devbox-cpplang -n devbox-cpp
    distrobox enter devbox-cpp
    
If you use toolbox:

    toolbox create -i ghcr.io/xlaaaain/devbox-cpplain -c devbox-cpp
    toolbox enter devbox-cpp

**NOTE:**

- You can use `chezmoi` to pull down your dotfiles and set up git sync.

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/quickstart/quickstart-cosign/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/xlaaaain/devbox
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/key_management/signing_with_self-managed_keys/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.
