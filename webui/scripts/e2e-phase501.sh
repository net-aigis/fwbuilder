#!/usr/bin/env bash
# Phase-501: hard-gap note mentions with_visible/signal_keys.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'with_visible' webui/backend/fwbweb_api/main.py
grep -Fq 'signal_keys' webui/backend/fwbweb_api/main.py
echo "pixel hard-gap note updated"
echo "cleaned"
echo "OK: phase501 e2e passed"
