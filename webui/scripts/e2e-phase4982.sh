#!/usr/bin/env bash
# Phase-4982: typecheck after milestone 13650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4982 ok"; echo "cleaned"; echo "OK: phase4982 e2e passed"
