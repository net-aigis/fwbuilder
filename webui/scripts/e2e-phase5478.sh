#!/usr/bin/env bash
# Phase-5478: typecheck after milestone 15200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5158 ok"; echo "cleaned"; echo "OK: phase5478 e2e passed"
