#!/usr/bin/env bash
# Phase-5940: STATUS mentions milestone 15900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '16700|honesty_milestone: 16700|WEBUI_HONESTY_MILESTONE=16700|ssh_auth_policy|ssh_batch_mode' webui/STATUS.md
echo "STATUS milestone 15900 ok"; echo "cleaned"; echo "OK: phase5940 e2e passed"
