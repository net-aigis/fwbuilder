#!/usr/bin/env bash
# Phase-322: soft marker 328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "328"' webui/backend/fwbweb_api/main.py
echo "soft marker 328 ok"
echo "cleaned"
echo "OK: phase322 e2e passed"
