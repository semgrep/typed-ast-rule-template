#!/bin/bash

set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODE_DIR="/analysis/inputs/r2c/typed-ast"

node $DIR/dist/index.js $CODE_DIR > /analysis/output/output.json
