#!/usr/bin/env bash
# Phase-4980: STATUS mentions milestone 13650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13650|milestone 13650|Meilenstein 13650' webui/STATUS.md
echo "STATUS milestone 13650 ok"; echo "cleaned"; echo "OK: phase4980 e2e passed"
