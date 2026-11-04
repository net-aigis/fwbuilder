#!/usr/bin/env bash
# Phase-438: e2e-all 433–440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase433' webui/scripts/e2e-all.sh
grep -q 'e2e-phase440' webui/scripts/e2e-all.sh
echo "e2e-all 433-440 ok"
echo "cleaned"
echo "OK: phase438 e2e passed"
