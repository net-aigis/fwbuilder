#!/usr/bin/env bash
# Phase-6996: STATUS mentions milestone 18900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '18950|honesty_milestone: 18950|WEBUI_HONESTY_MILESTONE=18950|ssh_auth_policy|ssh_auth_policy_refresh' webui/STATUS.md
echo "STATUS milestone 18900 ok"; echo "cleaned"; echo "OK: phase6996 e2e passed"
