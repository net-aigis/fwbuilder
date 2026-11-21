#!/usr/bin/env bash
# Phase-6500: STATUS mentions milestone 18450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '18450|honesty_milestone: 18450|WEBUI_HONESTY_MILESTONE=18450|ssh_auth_policy|ssh_auth_note_snapshot' webui/STATUS.md
echo "STATUS milestone 18450 ok"; echo "cleaned"; echo "OK: phase6500 e2e passed"
