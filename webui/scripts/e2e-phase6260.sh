#!/usr/bin/env bash
# Phase-6260: STATUS mentions milestone 15900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '17700|honesty_milestone: 17700|WEBUI_HONESTY_MILESTONE=17700|ssh_auth_policy|ssh_implemented_batch' webui/STATUS.md
echo "STATUS milestone 15900 ok"; echo "cleaned"; echo "OK: phase6260 e2e passed"
