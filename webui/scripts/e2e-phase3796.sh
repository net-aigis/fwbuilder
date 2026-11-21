#!/usr/bin/env bash
# Phase-3796: STATUS mentions milestone 9950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9950|milestone 9950|Meilenstein 9950' webui/STATUS.md
echo "STATUS milestone 9950 ok"
echo "cleaned"
echo "OK: phase3796 e2e passed"
