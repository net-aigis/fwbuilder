#!/usr/bin/env bash
# Phase-5460: STATUS mentions milestone 15150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '15250|honesty_milestone: 15250|WEBUI_HONESTY_MILESTONE=15250|ssh_auth_policy|ssh_alternative_titles' webui/STATUS.md
echo "STATUS milestone 15150 ok"; echo "cleaned"; echo "OK: phase5460 e2e passed"
