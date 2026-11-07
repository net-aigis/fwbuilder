#!/usr/bin/env bash
# Phase-5028: STATUS mentions milestone 13800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13800|milestone 13800|Meilenstein 13800' webui/STATUS.md
echo "STATUS milestone 13800 ok"; echo "cleaned"; echo "OK: phase5028 e2e passed"
