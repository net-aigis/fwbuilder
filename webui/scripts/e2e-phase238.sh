#!/usr/bin/env bash
# Phase-238: smoke hard-gaps + expect plan + compress ratio.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
bash webui/scripts/e2e-phase179.sh
bash webui/scripts/e2e-phase201.sh
bash webui/scripts/e2e-phase225.sh
echo "smoke 179/201/225 ok"
echo "cleaned"
echo "OK: phase238 e2e passed"
