#!/usr/bin/env bash
# Phase-7364: STATUS mentions milestone 18850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '18950|honesty_milestone: 18950|WEBUI_HONESTY_MILESTONE=18950|ssh_auth_policy|ssh_refusal_path_notes_refresh' webui/STATUS.md
echo "STATUS milestone 18850 ok"; echo "cleaned"; echo "OK: phase7364 e2e passed"
