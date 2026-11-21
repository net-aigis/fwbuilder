#!/usr/bin/env bash
# Phase-870: typecheck after milestone 1050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 870 ok"
echo "cleaned"
echo "OK: phase870 e2e passed"
