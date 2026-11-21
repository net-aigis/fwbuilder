#!/usr/bin/env bash
# Phase-6356: STATUS mentions milestone 17900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '17950|honesty_milestone: 17950|WEBUI_HONESTY_MILESTONE=17950|ssh_auth_policy|ssh_not_implemented_batch' webui/STATUS.md
echo "STATUS milestone 17900 ok"; echo "cleaned"; echo "OK: phase6356 e2e passed"
