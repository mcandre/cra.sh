#!/bin/bash
set -eEuo pipefail

find tests -type f -name '*.sh' -print0 |
    while IFS= read -r -d '' f; do
        "$f"
    done
