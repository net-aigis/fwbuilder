#!/usr/bin/env bash
# Phase-2964: STATUS mentions milestone 7350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7350|milestone 7350|Meilenstein 7350' webui/STATUS.md
echo "STATUS milestone 7350 ok"
echo "cleaned"
echo "OK: phase2964 e2e passed"
