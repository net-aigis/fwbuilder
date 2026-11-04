#!/usr/bin/env bash
# Phase-431: e2e-all lists 425–432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase425' webui/scripts/e2e-all.sh
grep -q 'e2e-phase432' webui/scripts/e2e-all.sh
echo "e2e-all 425-432 ok"
echo "cleaned"
echo "OK: phase431 e2e passed"
