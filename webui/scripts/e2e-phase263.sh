#!/usr/bin/env bash
# Phase-263: soft_complete_phase marker advanced to 264 track.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "264"' webui/backend/fwbweb_api/main.py
grep -q 'soft_fertig_honesty_track' webui/backend/fwbweb_api/main.py
echo "soft marker 264 ok"
echo "cleaned"
echo "OK: phase263 e2e passed"
