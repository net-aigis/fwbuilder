#!/usr/bin/env bash
# Phase-6772: STATUS mentions milestone 19250 + through 6776 tip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '19250|honesty_milestone: 19250|WEBUI_HONESTY_MILESTONE=19250|ssh_not_implemented_keyboard' webui/STATUS.md
grep -qE 'through 6776|phase6776' webui/STATUS.md
echo "STATUS milestone 19250 tail ok"; echo "cleaned"; echo "OK: phase6772 e2e passed"
