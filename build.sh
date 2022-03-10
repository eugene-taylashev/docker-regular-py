#!/bin/bash
set -e

docker build --no-cache --rm \
 -t etaylashev/regular-py:latest .

exit 0
