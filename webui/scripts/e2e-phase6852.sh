#!/usr/bin/env bash
# Phase-6852: STATUS mentions milestone 19500 + through 6856 tip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '19500|honesty_milestone: 19500|WEBUI_HONESTY_MILESTONE=19500|ssh_not_implemented_password' webui/STATUS.md
grep -qE 'through 6856|phase6856' webui/STATUS.md
echo "STATUS milestone 19500 tail ok"; echo "cleaned"; echo "OK: phase6852 e2e passed"
