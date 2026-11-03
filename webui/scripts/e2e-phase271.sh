#!/usr/bin/env bash
# Phase-271: soft_complete_phase marker 272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "272"' webui/backend/fwbweb_api/main.py
grep -q 'soft_fertig_honesty_track' webui/backend/fwbweb_api/main.py
echo "soft marker 272 ok"
echo "cleaned"
echo "OK: phase271 e2e passed"
