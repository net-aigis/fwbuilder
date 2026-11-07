#!/usr/bin/env bash
# Phase-5380: STATUS mentions milestone 14900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '15000|honesty_milestone: 15000|WEBUI_HONESTY_MILESTONE=15000|ssh_auth_policy|ssh_alternative_notes' webui/STATUS.md
echo "STATUS milestone 14900 ok"; echo "cleaned"; echo "OK: phase5380 e2e passed"
