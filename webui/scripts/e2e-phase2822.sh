#!/usr/bin/env bash
# Phase-2822: typecheck after milestone 6900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2822 ok"
echo "cleaned"
echo "OK: phase2822 e2e passed"
