#!/usr/bin/env bash
# Set access to global node_modules to the current user
# Mac OS
[ -d "/usr/local/lib/node_modules" ] && 
chown -R $USER /usr/local/lib/node_modules 
# Linux
[ -d "/usr/lib/node_modules" ] && 
chown -R $USER /usr/lib/node_modules
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Set Rust PATH
source $HOME/.cargo/env
# Update Rust 
rustup update stable
rustup update nightly
# Get wasm target option
rustup target list --installed
rustup default nightly
rustup target add wasm32-unknown-unknown
