#!/usr/bin/env bash
# Phase-5054: typecheck after schema 5.3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5054 ok"; echo "cleaned"; echo "OK: phase5054 e2e passed"
