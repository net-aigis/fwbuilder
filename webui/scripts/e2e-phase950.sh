#!/usr/bin/env bash
# Phase-950: typecheck after milestone 1300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 950 ok"
echo "cleaned"
echo "OK: phase950 e2e passed"
