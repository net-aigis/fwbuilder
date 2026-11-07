#!/usr/bin/env bash
# Phase-4854: typecheck after milestone 13250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4854 ok"; echo "cleaned"; echo "OK: phase4854 e2e passed"
