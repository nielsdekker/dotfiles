#!/bin/bash

set -eu

echo "Updating DCONF values"

dconf load / < ./gnome.ini
dconf load / < ./extensions.ini
