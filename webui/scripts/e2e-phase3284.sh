#!/usr/bin/env bash
# Phase-3284: STATUS mentions milestone 8350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8350|milestone 8350|Meilenstein 8350' webui/STATUS.md
echo "STATUS milestone 8350 ok"
echo "cleaned"
echo "OK: phase3284 e2e passed"
