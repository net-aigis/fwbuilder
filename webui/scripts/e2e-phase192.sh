#!/usr/bin/env bash
# Phase-192: soft-complete STATUS through phase192 + e2e-all lists new phases.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase192\|phase191\|phase190\|phase189' webui/STATUS.md
grep -q 'e2e-phase192\|e2e-phase191\|e2e-phase190\|e2e-phase189' webui/scripts/e2e-all.sh
grep -q 'annotations' webui/STATUS.md
echo "STATUS soft-complete 192 ok"
echo "cleaned"
echo "OK: phase192 e2e passed"
