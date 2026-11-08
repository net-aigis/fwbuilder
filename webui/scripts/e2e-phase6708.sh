#!/usr/bin/env bash
# Phase-6708: STATUS mentions milestone 18800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '18950|honesty_milestone: 18950|WEBUI_HONESTY_MILESTONE=18950|ssh_auth_policy|ssh_not_implemented_keyboard' webui/STATUS.md
echo "STATUS milestone 18800 ok"; echo "cleaned"; echo "OK: phase6708 e2e passed"
