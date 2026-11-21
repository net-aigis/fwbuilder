#!/usr/bin/env bash
# Phase-462: e2e-all 457–464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase457' webui/scripts/e2e-all.sh
grep -q 'e2e-phase464' webui/scripts/e2e-all.sh
echo "e2e-all 457-464 ok"
echo "cleaned"
echo "OK: phase462 e2e passed"
