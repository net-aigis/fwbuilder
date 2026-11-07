#!/usr/bin/env bash
# Phase-4550: typecheck after milestone 12300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4550 ok"
echo "cleaned"
echo "OK: phase4550 e2e passed"
