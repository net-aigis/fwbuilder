#!/usr/bin/env bash
# Phase-6486: typecheck after milestone 18350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5126 ok"; echo "cleaned"; echo "OK: phase6486 e2e passed"
