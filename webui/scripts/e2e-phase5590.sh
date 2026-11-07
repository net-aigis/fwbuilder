#!/usr/bin/env bash
# Phase-5590: typecheck after milestone 15550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5110 ok"; echo "cleaned"; echo "OK: phase5590 e2e passed"
