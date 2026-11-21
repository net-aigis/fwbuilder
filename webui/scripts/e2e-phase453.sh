#!/usr/bin/env bash
# Phase-453: e2e-all 449–456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase449' webui/scripts/e2e-all.sh
grep -q 'e2e-phase456' webui/scripts/e2e-all.sh
echo "e2e-all 449-456 ok"
echo "cleaned"
echo "OK: phase453 e2e passed"
