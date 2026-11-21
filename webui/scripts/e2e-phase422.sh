#!/usr/bin/env bash
# Phase-422: e2e-all lists 417–424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase417' webui/scripts/e2e-all.sh
grep -q 'e2e-phase424' webui/scripts/e2e-all.sh
echo "e2e-all 417-424 ok"
echo "cleaned"
echo "OK: phase422 e2e passed"
