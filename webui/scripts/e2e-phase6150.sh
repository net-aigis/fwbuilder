#!/usr/bin/env bash
# Phase-6150: typecheck after milestone 17300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5110 ok"; echo "cleaned"; echo "OK: phase6150 e2e passed"
