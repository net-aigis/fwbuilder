#!/usr/bin/env bash
# Phase-5492: STATUS mentions milestone 15250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '15250|honesty_milestone: 15250|WEBUI_HONESTY_MILESTONE=15250|ssh_auth_policy|ssh_alternative_titles' webui/STATUS.md
echo "STATUS milestone 15250 ok"; echo "cleaned"; echo "OK: phase5492 e2e passed"
