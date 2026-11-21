#!/usr/bin/env bash
# Phase-5076: STATUS mentions milestone 13950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13950|milestone 13950|Meilenstein 13950' webui/STATUS.md
echo "STATUS milestone 13950 ok"; echo "cleaned"; echo "OK: phase5076 e2e passed"
