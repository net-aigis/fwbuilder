#!/usr/bin/env bash
# Phase-414: e2e-all lists 409–416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase409' webui/scripts/e2e-all.sh
grep -q 'e2e-phase416' webui/scripts/e2e-all.sh
echo "e2e-all 409-416 ok"
echo "cleaned"
echo "OK: phase414 e2e passed"
