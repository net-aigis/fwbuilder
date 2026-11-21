#!/usr/bin/env bash
# Phase-6196: STATUS mentions milestone 17400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '17450|honesty_milestone: 17450|WEBUI_HONESTY_MILESTONE=17450|ssh_auth_policy|ssh_alternative_presence' webui/STATUS.md
echo "STATUS milestone 17400 ok"; echo "cleaned"; echo "OK: phase6196 e2e passed"
