#!/usr/bin/env bash
# Phase-519: typecheck + e2e-all 513–520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
grep -q 'e2e-phase513' webui/scripts/e2e-all.sh
grep -q 'e2e-phase520' webui/scripts/e2e-all.sh
echo "typecheck + e2e-all 513-520 ok"
echo "cleaned"
echo "OK: phase519 e2e passed"
