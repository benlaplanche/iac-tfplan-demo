#!/bin/bash

opa build -t wasm -e "main/deny" --output custom.tar.gz custom.rego