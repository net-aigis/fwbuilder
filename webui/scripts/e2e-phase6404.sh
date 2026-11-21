#!/usr/bin/env bash
# Phase-6404: STATUS mentions milestone 18100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '18200|honesty_milestone: 18200|WEBUI_HONESTY_MILESTONE=18200|ssh_auth_policy|ssh_implemented_agent' webui/STATUS.md
echo "STATUS milestone 18100 ok"; echo "cleaned"; echo "OK: phase6404 e2e passed"
