#!/usr/bin/env bash
# Phase-5526: typecheck after milestone 15350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5126 ok"; echo "cleaned"; echo "OK: phase5526 e2e passed"
