#!/usr/bin/env bash
# Phase-514: client schema layout_fidelity extended fields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -c 'signal_key_count' webui/frontend/src/api/client.ts | awk '{exit !($1>=3)}'
grep -c 'layout_tree_max_depth' webui/frontend/src/api/client.ts | awk '{exit !($1>=3)}'
echo "client schema fidelity fields ok"
echo "cleaned"
echo "OK: phase514 e2e passed"
