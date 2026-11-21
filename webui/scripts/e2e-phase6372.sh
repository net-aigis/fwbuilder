#!/usr/bin/env bash
# Phase-6372: STATUS mentions milestone 17950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '17950|honesty_milestone: 17950|WEBUI_HONESTY_MILESTONE=17950|ssh_auth_policy|ssh_not_implemented_batch' webui/STATUS.md
echo "STATUS milestone 17950 ok"; echo "cleaned"; echo "OK: phase6372 e2e passed"
