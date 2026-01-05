#!/bin/bash

# Helper script to setup opencode in a docker image, this script assumes the
# default opencode config is used. This is needed for the MCP setup.

set -e

echo "Building the container..."
podman build -t opencode-image -f opencode.dockerfile .

echo "Setting up the MCP's"

# First make sure we have a container to copy stuff from
podman create \
    --name opencode-container \
    --replace \
    --entrypoint '["opencode", "--version"]' \
    opencode-image

# Copy the relevant data
mkdir temp
podman cp opencode-container:/usr/local/bin/opencode ./temp/opencode

chmod +x ./temp/opencode

echo "Setting up oauth"
./temp/opencode mcp auth jira

# And update the data in the container
podman cp ~/.local/share/opencode/mcp-auth.json opencode-container:/root/.local/share/opencode/mcp-auth.json

echo "Cleanup"
rm -r ./temp
podman container rm opencode-container
