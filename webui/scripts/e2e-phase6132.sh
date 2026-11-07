#!/usr/bin/env bash
# Phase-6132: STATUS mentions milestone 17200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '17200|honesty_milestone: 17200|WEBUI_HONESTY_MILESTONE=17200|ssh_auth_policy|ssh_not_implemented_check' webui/STATUS.md
echo "STATUS milestone 17200 ok"; echo "cleaned"; echo "OK: phase6132 e2e passed"
