#!/bin/sh
# Build step: downloads the two small libraries the app needs into ./vendor.
# Vercel build command: sh setup.sh

set -e

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is required to run this script."
  exit 1
fi

echo "Downloading libraries..."
rm -rf tmp-deps
mkdir tmp-deps
cd tmp-deps
npm init -y >/dev/null
npm install mp4box mp4-muxer
cd ..

echo "Copying files into ./vendor..."
rm -rf vendor
mkdir vendor
cp tmp-deps/node_modules/mp4box/dist/mp4box.all.min.js vendor/
cp tmp-deps/node_modules/mp4-muxer/build/mp4-muxer.mjs vendor/

rm -rf tmp-deps

echo "Done. Contents of ./vendor:"
ls -la vendor
