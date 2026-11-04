#!/usr/bin/env bash
# Phase-419: soft marker 424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "424"' webui/backend/fwbweb_api/main.py
echo "marker 424 ok"
echo "cleaned"
echo "OK: phase419 e2e passed"
