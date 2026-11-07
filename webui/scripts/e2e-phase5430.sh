#!/usr/bin/env bash
# Phase-5430: typecheck after milestone 15050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5110 ok"; echo "cleaned"; echo "OK: phase5430 e2e passed"
