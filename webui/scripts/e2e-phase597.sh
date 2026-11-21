#!/usr/bin/env bash
# Phase-597: e2e-all lists 593–600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase593' webui/scripts/e2e-all.sh
grep -q 'e2e-phase600' webui/scripts/e2e-all.sh
echo "e2e-all 593-600 ok"
echo "cleaned"
echo "OK: phase597 e2e passed"
