#!/bin/bash

source="$1"

if [ -z "$source" ]; then
    echo "Invalid parameters. Please provide source input file, e.g. EXAMPLE.sample_xhprof"
    exit 27
fi

target="$2"

if [ -z "$target" ]; then
    target="$source.svg"
fi

directory=$(dirname "$source")
filename=$(basename "$source")

docker build -t flamegraph .
docker run -v "$directory:/opt/sources" flamegraph "/opt/sources/$filename" > "$target"
