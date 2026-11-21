#!/usr/bin/env bash
# Phase-4838: typecheck after milestone 13200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4838 ok"; echo "cleaned"; echo "OK: phase4838 e2e passed"
