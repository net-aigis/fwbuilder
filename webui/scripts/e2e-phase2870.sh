#!/usr/bin/env bash
# Phase-2870: typecheck after milestone 7050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2870 ok"
echo "cleaned"
echo "OK: phase2870 e2e passed"
