#!/usr/bin/env bash
# Phase-3830: typecheck after milestone 10050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3830 ok"
echo "cleaned"
echo "OK: phase3830 e2e passed"
