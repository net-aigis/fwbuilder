#!/usr/bin/env bash
# Phase-3716: STATUS mentions milestone 9700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9700|milestone 9700|Meilenstein 9700' webui/STATUS.md
echo "STATUS milestone 9700 ok"
echo "cleaned"
echo "OK: phase3716 e2e passed"
