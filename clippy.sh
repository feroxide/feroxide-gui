#!/bin/bash

mode="$1"

<<<<<<< HEAD
if [ "$TRAVIS_RUST_VERSION" = "nightly" ]; then
  if [ "$mode" = "install" ]; then
    # Test if clippy is already installed (cache)
<<<<<<< HEAD
    if cargo clippy -V; then
      echo "Clippy already installed, skipping installation"
=======
    cargo clippy &> /dev/null
    if [ $? -ne 101 ]; then
>>>>>>> 97a3db4 (Fix Travis failing on installing Clippy when it's already in cache)
      exit 0
    fi
=======
if [ "$TRAVIS_RUST_VERSION" != "nightly" ] && [ "$RUSTUP_NIGHTLY" != "yes" ]; then
  exit 0
fi
>>>>>>> 2eb2064 (Fixed clippy script)

CARGO="cargo"

if [ "$RUSTUP_NIGHTLY" = "yes" ]; then
  CARGO="rustup run nightly cargo"
fi


if [ "$mode" = "install" ]; then
  # Test if clippy is already installed (cache)
  if $CARGO clippy -V; then
    exit 0
  fi

  # Clippy could be installed, but failed on the version check, added --force for that case
  $CARGO install clippy --force --verbose
  exit $?
elif [ "$mode" = "test" ]; then
  $CARGO clippy --verbose -- -D warnings
  exit $?
else
  echo "Mode not specified or unknown" >&2
  exit 1
fi
