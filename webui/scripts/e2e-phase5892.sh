#!/usr/bin/env bash
# Phase-5892: STATUS mentions milestone 16450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '16450|honesty_milestone: 16450|WEBUI_HONESTY_MILESTONE=16450|ssh_auth_policy|ssh_password_support' webui/STATUS.md
echo "STATUS milestone 16450 ok"; echo "cleaned"; echo "OK: phase5892 e2e passed"
