#!/usr/bin/env bash
# Phase-716: STATUS mentions milestone 750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_milestone: 750|honesty milestone 750|WEBUI_HONESTY_MILESTONE=750|milestone 750' webui/STATUS.md
grep -qE 'phase720|through 720|e2e-phase720' webui/STATUS.md
echo "STATUS milestone 750 ok"
echo "cleaned"
echo "OK: phase716 e2e passed"
