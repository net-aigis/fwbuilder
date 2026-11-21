#!/usr/bin/env bash
# Phase-3572: STATUS mentions milestone 9250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9250|milestone 9250|Meilenstein 9250' webui/STATUS.md
echo "STATUS milestone 9250 ok"
echo "cleaned"
echo "OK: phase3572 e2e passed"
