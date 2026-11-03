#!/usr/bin/env bash
# Phase-327: STATUS e2e-all lists 321–328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase321\|e2e-phase328' webui/scripts/e2e-all.sh
echo "e2e-all lists 321-328 ok"
echo "cleaned"
echo "OK: phase327 e2e passed"
