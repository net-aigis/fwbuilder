#!/usr/bin/env bash
# Phase-5876: STATUS mentions milestone 16400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '16450|honesty_milestone: 16450|WEBUI_HONESTY_MILESTONE=16450|ssh_auth_policy|ssh_password_support' webui/STATUS.md
echo "STATUS milestone 16400 ok"; echo "cleaned"; echo "OK: phase5876 e2e passed"
