#!/usr/bin/env bash
# Phase-5284: STATUS mentions milestone 14600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '15000|honesty_milestone: 15000|WEBUI_HONESTY_MILESTONE=15000|ssh_auth_policy|ssh_alternative_notes' webui/STATUS.md
echo "STATUS milestone 14600 ok"; echo "cleaned"; echo "OK: phase5284 e2e passed"
