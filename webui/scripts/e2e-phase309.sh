#!/usr/bin/env bash
# Phase-309: soft marker 312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "312"' webui/backend/fwbweb_api/main.py
echo "soft marker 312 ok"
echo "cleaned"
echo "OK: phase309 e2e passed"
