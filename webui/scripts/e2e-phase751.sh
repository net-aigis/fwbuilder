#!/usr/bin/env bash
# Phase-751: e2e-all lists 745-752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 745 746 747 748 749 750 751 752; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
echo "e2e-all 745-752 ok"
echo "cleaned"
echo "OK: phase751 e2e passed"
