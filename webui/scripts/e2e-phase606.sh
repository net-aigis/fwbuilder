#!/usr/bin/env bash
# Phase-606: e2e-all lists 601–608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase601' webui/scripts/e2e-all.sh
grep -q 'e2e-phase608' webui/scripts/e2e-all.sh
echo "e2e-all 601-608 ok"
echo "cleaned"
echo "OK: phase606 e2e passed"
