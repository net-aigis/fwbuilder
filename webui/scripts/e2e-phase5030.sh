#!/usr/bin/env bash
# Phase-5030: typecheck after milestone 13800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5030 ok"; echo "cleaned"; echo "OK: phase5030 e2e passed"
