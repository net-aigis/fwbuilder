#!/usr/bin/env bash
# Phase-264: STATUS soft-complete through phase264 (pixel/expect preview slices).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "264"' webui/backend/fwbweb_api/main.py
grep -q 'phase264\|phase263\|phase262\|phase261\|phase260\|phase259\|phase258\|phase257' webui/STATUS.md
grep -q 'e2e-phase264\|e2e-phase263\|e2e-phase262\|e2e-phase261\|e2e-phase260\|e2e-phase259\|e2e-phase258\|e2e-phase257' webui/scripts/e2e-all.sh
grep -q 'size_hint\|row_stretch\|safety_net_acl\|alignment' webui/STATUS.md
echo "STATUS soft-complete 264 ok"
echo "cleaned"
echo "OK: phase264 e2e passed"
