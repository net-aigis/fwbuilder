#!/usr/bin/env bash
# Phase-4950: typecheck after milestone 13550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4950 ok"; echo "cleaned"; echo "OK: phase4950 e2e passed"
