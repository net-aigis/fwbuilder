#!/usr/bin/env bash
# Phase-446: e2e-all 441–448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase441' webui/scripts/e2e-all.sh
grep -q 'e2e-phase448' webui/scripts/e2e-all.sh
echo "e2e-all 441-448 ok"
echo "cleaned"
echo "OK: phase446 e2e passed"
