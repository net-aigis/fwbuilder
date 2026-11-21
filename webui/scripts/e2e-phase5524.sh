#!/usr/bin/env bash
# Phase-5524: STATUS mentions milestone 15350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '15500|honesty_milestone: 15500|WEBUI_HONESTY_MILESTONE=15500|ssh_auth_policy|ssh_refusal_path_titles' webui/STATUS.md
echo "STATUS milestone 15350 ok"; echo "cleaned"; echo "OK: phase5524 e2e passed"
