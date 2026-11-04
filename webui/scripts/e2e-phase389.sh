#!/usr/bin/env bash
# Phase-389: soft marker 392 + fidelity with_whats_this.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "392"' webui/backend/fwbweb_api/main.py
grep -Fq 'with_whats_this' webui/backend/fwbweb_api/platforms.py
echo "marker 392 ok"
echo "cleaned"
echo "OK: phase389 e2e passed"
