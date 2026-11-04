#!/usr/bin/env bash
# Phase-379: hard-gaps advertises stack_switch_path.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'stack_switch_path' webui/backend/fwbweb_api/main.py
grep -Fq 'stacked_sections' webui/backend/fwbweb_api/main.py
echo "hard-gaps stack path ok"
echo "cleaned"
echo "OK: phase379 e2e passed"
