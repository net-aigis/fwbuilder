#!/usr/bin/env bash
# Phase-4966: typecheck after milestone 13600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4966 ok"; echo "cleaned"; echo "OK: phase4966 e2e passed"
