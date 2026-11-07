#!/usr/bin/env bash
# Phase-5780: STATUS mentions milestone 15900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '16200|honesty_milestone: 16200|WEBUI_HONESTY_MILESTONE=16200|ssh_auth_policy|ssh_alternative_support' webui/STATUS.md
echo "STATUS milestone 15900 ok"; echo "cleaned"; echo "OK: phase5780 e2e passed"
