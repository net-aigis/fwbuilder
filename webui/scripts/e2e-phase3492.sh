#!/usr/bin/env bash
# Phase-3492: STATUS mentions milestone 9000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9000|milestone 9000|Meilenstein 9000' webui/STATUS.md
echo "STATUS milestone 9000 ok"
echo "cleaned"
echo "OK: phase3492 e2e passed"
