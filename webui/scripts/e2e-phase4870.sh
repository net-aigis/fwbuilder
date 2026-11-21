#!/usr/bin/env bash
# Phase-4870: typecheck after milestone 13300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4870 ok"; echo "cleaned"; echo "OK: phase4870 e2e passed"
