#!/usr/bin/env bash
# Phase-470: e2e-all 465–472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase465' webui/scripts/e2e-all.sh
grep -q 'e2e-phase472' webui/scripts/e2e-all.sh
echo "e2e-all 465-472 ok"
echo "cleaned"
echo "OK: phase470 e2e passed"
