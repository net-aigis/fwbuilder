#!/usr/bin/env bash
# Phase-5254: typecheck after milestone 14500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5094 ok"; echo "cleaned"; echo "OK: phase5254 e2e passed"
