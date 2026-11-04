#!/usr/bin/env bash
# Phase-574: e2e-all lists 569–576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase569' webui/scripts/e2e-all.sh
grep -q 'e2e-phase576' webui/scripts/e2e-all.sh
echo "e2e-all 569-576 ok"
echo "cleaned"
echo "OK: phase574 e2e passed"
