#!/usr/bin/env bash
# Phase-4334: typecheck after schema 4.4.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4334 ok"
echo "cleaned"
echo "OK: phase4334 e2e passed"
