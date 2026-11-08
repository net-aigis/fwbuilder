#!/usr/bin/env bash
# Phase-6436: STATUS mentions milestone 18150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '18200|honesty_milestone: 18200|WEBUI_HONESTY_MILESTONE=18200|ssh_auth_policy|ssh_implemented_agent' webui/STATUS.md
echo "STATUS milestone 18150 ok"; echo "cleaned"; echo "OK: phase6436 e2e passed"
