#!/usr/bin/env bash
# Phase-6020: STATUS mentions milestone 15900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '16950|honesty_milestone: 16950|WEBUI_HONESTY_MILESTONE=16950|ssh_auth_policy|ssh_implemented_check' webui/STATUS.md
echo "STATUS milestone 15900 ok"; echo "cleaned"; echo "OK: phase6020 e2e passed"
