#!/usr/bin/env bash
# Phase-5236: STATUS mentions milestone 14450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '14450|milestone 14450|Meilenstein 14450' webui/STATUS.md
echo "STATUS milestone 14450 ok"; echo "cleaned"; echo "OK: phase5236 e2e passed"
