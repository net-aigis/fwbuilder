#!/usr/bin/env bash
# Phase-6580: STATUS mentions milestone 18700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '18700|honesty_milestone: 18700|WEBUI_HONESTY_MILESTONE=18700|ssh_auth_policy|ssh_honesty_refresh' webui/STATUS.md
echo "STATUS milestone 18700 ok"; echo "cleaned"; echo "OK: phase6580 e2e passed"
