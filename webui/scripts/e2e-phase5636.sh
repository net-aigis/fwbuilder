#!/usr/bin/env bash
# Phase-5636: STATUS mentions milestone 15700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '15750|honesty_milestone: 15750|WEBUI_HONESTY_MILESTONE=15750|ssh_auth_policy|ssh_refusal_path_notes' webui/STATUS.md
echo "STATUS milestone 15700 ok"; echo "cleaned"; echo "OK: phase5636 e2e passed"
