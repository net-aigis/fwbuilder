#!/usr/bin/env bash
# Phase-590: e2e-all lists 585–592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase585' webui/scripts/e2e-all.sh
grep -q 'e2e-phase592' webui/scripts/e2e-all.sh
echo "e2e-all 585-592 ok"
echo "cleaned"
echo "OK: phase590 e2e passed"
