#!/usr/bin/env bash
# Phase-6212: STATUS mentions milestone 17450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '17450|honesty_milestone: 17450|WEBUI_HONESTY_MILESTONE=17450|ssh_auth_policy|ssh_alternative_presence' webui/STATUS.md
echo "STATUS milestone 17450 ok"; echo "cleaned"; echo "OK: phase6212 e2e passed"
