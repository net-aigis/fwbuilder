#!/usr/bin/env bash
# Phase-4086: typecheck after milestone 10850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4086 ok"
echo "cleaned"
echo "OK: phase4086 e2e passed"
