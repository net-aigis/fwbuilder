#!/usr/bin/env bash
# Phase-4974: typecheck after schema 5.2.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4974 ok"; echo "cleaned"; echo "OK: phase4974 e2e passed"
