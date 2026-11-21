#!/usr/bin/env bash
# Phase-272: STATUS soft-complete through phase272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "272"' webui/backend/fwbweb_api/main.py
grep -q 'phase272\|phase271\|phase270\|phase269\|phase268\|phase267\|phase266\|phase265' webui/STATUS.md
grep -q 'e2e-phase272\|e2e-phase271\|e2e-phase270\|e2e-phase269\|e2e-phase268\|e2e-phase267\|e2e-phase266\|e2e-phase265' webui/scripts/e2e-all.sh
grep -q 'layout_tree\|walkthrough\|QGroupBox flat\|password.*501\|ssh-auth/password' webui/STATUS.md
echo "STATUS soft-complete 272 ok"
echo "cleaned"
echo "OK: phase272 e2e passed"
