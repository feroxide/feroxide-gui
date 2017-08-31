#!/bin/sh

mode="$1"

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

    cargo install clippy
    exit $?
  fi

  if [ "$mode" = "test" ]; then
    cargo clippy --verbose -- -D warnings
    exit $?
  fi
fi

exit 0
