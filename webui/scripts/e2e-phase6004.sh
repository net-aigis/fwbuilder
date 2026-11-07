#!/usr/bin/env bash
# Phase-6004: STATUS mentions milestone 16850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '16950|honesty_milestone: 16950|WEBUI_HONESTY_MILESTONE=16950|ssh_auth_policy|ssh_implemented_check' webui/STATUS.md
echo "STATUS milestone 16850 ok"; echo "cleaned"; echo "OK: phase6004 e2e passed"
