#!/bin/sh
set -e

export PATH="/usr/local/bin:$PATH"

ssh-add --apple-load-keychain || true

container system start
container start dev-container