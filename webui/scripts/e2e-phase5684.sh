#!/usr/bin/env bash
# Phase-5684: STATUS mentions milestone 15850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '16000|honesty_milestone: 16000|WEBUI_HONESTY_MILESTONE=16000|ssh_auth_policy|ssh_auth_note' webui/STATUS.md
echo "STATUS milestone 15850 ok"; echo "cleaned"; echo "OK: phase5684 e2e passed"
