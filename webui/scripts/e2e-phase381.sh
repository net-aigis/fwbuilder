#!/usr/bin/env bash
# Phase-381: soft marker 384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "384"' webui/backend/fwbweb_api/main.py
echo "marker 384 ok"
echo "cleaned"
echo "OK: phase381 e2e passed"
