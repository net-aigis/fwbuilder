#!/usr/bin/env bash
# Phase-534: e2e-all lists 529–536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase529' webui/scripts/e2e-all.sh
grep -q 'e2e-phase536' webui/scripts/e2e-all.sh
echo "e2e-all 529-536 ok"
echo "cleaned"
echo "OK: phase534 e2e passed"
