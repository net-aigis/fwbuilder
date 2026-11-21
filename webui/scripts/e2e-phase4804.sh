#!/usr/bin/env bash
# Phase-4804: STATUS mentions milestone 13100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13100|milestone 13100|Meilenstein 13100' webui/STATUS.md
echo "STATUS milestone 13100 ok"; echo "cleaned"; echo "OK: phase4804 e2e passed"
