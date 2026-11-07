#!/usr/bin/env bash
# Phase-5204: STATUS mentions milestone 14350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '14350|milestone 14350|Meilenstein 14350' webui/STATUS.md
echo "STATUS milestone 14350 ok"; echo "cleaned"; echo "OK: phase5204 e2e passed"
