#!/bin/sh

zig build-exe -target wasm32-freestanding-none --release-fast src/main.zig
