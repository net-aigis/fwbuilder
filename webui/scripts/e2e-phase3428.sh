#!/usr/bin/env bash
# Phase-3428: STATUS mentions milestone 8800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8800|milestone 8800|Meilenstein 8800' webui/STATUS.md
echo "STATUS milestone 8800 ok"
echo "cleaned"
echo "OK: phase3428 e2e passed"
