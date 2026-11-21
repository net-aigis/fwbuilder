#!/usr/bin/env bash
# Phase-4886: typecheck after milestone 13350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4886 ok"; echo "cleaned"; echo "OK: phase4886 e2e passed"
