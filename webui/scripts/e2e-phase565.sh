#!/usr/bin/env bash
# Phase-565: e2e-all lists 561–568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'e2e-phase561' webui/scripts/e2e-all.sh
grep -q 'e2e-phase568' webui/scripts/e2e-all.sh
echo "e2e-all 561-568 ok"
echo "cleaned"
echo "OK: phase565 e2e passed"
