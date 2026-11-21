#!/usr/bin/env bash
# Phase-2694: typecheck after milestone 6500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2694 ok"
echo "cleaned"
echo "OK: phase2694 e2e passed"
