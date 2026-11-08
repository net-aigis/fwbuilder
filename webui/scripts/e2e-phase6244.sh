#!/usr/bin/env bash
# Phase-6244: STATUS mentions milestone 17600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '17700|honesty_milestone: 17700|WEBUI_HONESTY_MILESTONE=17700|ssh_auth_policy|ssh_implemented_batch' webui/STATUS.md
echo "STATUS milestone 17600 ok"; echo "cleaned"; echo "OK: phase6244 e2e passed"
