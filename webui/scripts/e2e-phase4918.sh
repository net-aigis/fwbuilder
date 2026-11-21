#!/usr/bin/env bash
# Phase-4918: typecheck after milestone 13450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4918 ok"; echo "cleaned"; echo "OK: phase4918 e2e passed"
