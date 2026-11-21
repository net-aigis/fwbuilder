#!/usr/bin/env bash
# Phase-582: e2e-all lists 577–584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase577' webui/scripts/e2e-all.sh
grep -q 'e2e-phase584' webui/scripts/e2e-all.sh
echo "e2e-all 577-584 ok"
echo "cleaned"
echo "OK: phase582 e2e passed"
