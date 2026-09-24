#!/bin/sh
set -e

container rm -f dev-container || true
ssh-keygen -R "[localhost]:2222" || true

ssh-add --apple-load-keychain || true

container run -d --name dev-container -m 8G -p 2222:22 \
  -v ~/.ssh/id_ed25519.pub:/root/.ssh/authorized_keys:ro \
  -v ~/workspace:/root/workspace dev-image