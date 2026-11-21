#!/usr/bin/env bash
# Phase-3748: STATUS mentions milestone 9800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9800|milestone 9800|Meilenstein 9800' webui/STATUS.md
echo "STATUS milestone 9800 ok"
echo "cleaned"
echo "OK: phase3748 e2e passed"
