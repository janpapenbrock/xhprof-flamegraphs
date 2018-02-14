#!/bin/bash

/opt/xhprof-sample-to-flamegraph-stacks "$*" | flamegraph.pl
