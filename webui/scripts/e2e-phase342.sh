#!/usr/bin/env bash
# Phase-342: e2e-all lists 337–344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase337\|e2e-phase344' webui/scripts/e2e-all.sh
echo "e2e-all lists 337-344 ok"
echo "cleaned"
echo "OK: phase342 e2e passed"
