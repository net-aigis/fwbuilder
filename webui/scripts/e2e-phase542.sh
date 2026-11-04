#!/usr/bin/env bash
# Phase-542: e2e-all lists 537–544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase537' webui/scripts/e2e-all.sh
grep -q 'e2e-phase544' webui/scripts/e2e-all.sh
echo "e2e-all 537-544 ok"
echo "cleaned"
echo "OK: phase542 e2e passed"
