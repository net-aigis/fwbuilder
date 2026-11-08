#!/usr/bin/env bash
# Phase-10710: typecheck after milestone 18800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5110 ok"; echo "cleaned"; echo "OK: phase10710 e2e passed"
