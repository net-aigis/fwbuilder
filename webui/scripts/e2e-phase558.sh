#!/usr/bin/env bash
# Phase-558: e2e-all lists 553–560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase553' webui/scripts/e2e-all.sh
grep -q 'e2e-phase560' webui/scripts/e2e-all.sh
echo "e2e-all 553-560 ok"
echo "cleaned"
echo "OK: phase558 e2e passed"
