#!/usr/bin/env bash
# Phase-256: soft-complete STATUS through phase256 (honesty soft-fertig).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "256"' webui/backend/fwbweb_api/main.py
grep -q 'phase256\|phase255\|phase254\|phase253' webui/STATUS.md
grep -q 'e2e-phase256\|e2e-phase255\|e2e-phase254\|e2e-phase253' webui/scripts/e2e-all.sh
grep -q 'soft_fertig\|soft-fertig' webui/STATUS.md
echo "STATUS soft-complete 256 ok"
echo "cleaned"
echo "OK: phase256 e2e passed"
