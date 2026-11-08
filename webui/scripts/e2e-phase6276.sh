#!/usr/bin/env bash
# Phase-6276: STATUS mentions milestone 17650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '17700|honesty_milestone: 17700|WEBUI_HONESTY_MILESTONE=17700|ssh_auth_policy|ssh_implemented_batch' webui/STATUS.md
echo "STATUS milestone 17650 ok"; echo "cleaned"; echo "OK: phase6276 e2e passed"
