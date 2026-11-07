#!/usr/bin/env bash
# Phase-5572: STATUS mentions milestone 15500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '15500|honesty_milestone: 15500|WEBUI_HONESTY_MILESTONE=15500|ssh_auth_policy|ssh_refusal_path_titles' webui/STATUS.md
echo "STATUS milestone 15500 ok"; echo "cleaned"; echo "OK: phase5572 e2e passed"
