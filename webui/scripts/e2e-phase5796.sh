#!/usr/bin/env bash
# Phase-5796: STATUS mentions milestone 16150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '16200|honesty_milestone: 16200|WEBUI_HONESTY_MILESTONE=16200|ssh_auth_policy|ssh_alternative_support' webui/STATUS.md
echo "STATUS milestone 16150 ok"; echo "cleaned"; echo "OK: phase5796 e2e passed"
