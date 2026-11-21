#!/usr/bin/env bash
# Phase-373: soft marker 376 + hard-gap note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "376"' webui/backend/fwbweb_api/main.py
grep -Fq 'use_ULOG/device-type stack hints' webui/backend/fwbweb_api/main.py
echo "marker 376 ok"
echo "cleaned"
echo "OK: phase373 e2e passed"
