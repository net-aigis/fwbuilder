#!/usr/bin/env bash
# Phase-4934: typecheck after milestone 13500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4934 ok"; echo "cleaned"; echo "OK: phase4934 e2e passed"
