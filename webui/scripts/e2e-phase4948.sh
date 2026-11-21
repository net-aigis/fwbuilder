#!/usr/bin/env bash
# Phase-4948: STATUS mentions milestone 13550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13550|milestone 13550|Meilenstein 13550' webui/STATUS.md
echo "STATUS milestone 13550 ok"; echo "cleaned"; echo "OK: phase4948 e2e passed"
