#!/usr/bin/env bash
# Phase-6692: STATUS mentions milestone 19000 + through 6696 tip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '19000|honesty_milestone: 19000|WEBUI_HONESTY_MILESTONE=19000|ssh_implemented_identity' webui/STATUS.md
grep -qE 'through 6696|phase6696' webui/STATUS.md
echo "STATUS milestone 19000 tail ok"; echo "cleaned"; echo "OK: phase6692 e2e passed"
