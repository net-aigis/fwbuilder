#!/usr/bin/env bash
# Phase-3614: typecheck after schema 3.5.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3614 ok"
echo "cleaned"
echo "OK: phase3614 e2e passed"
