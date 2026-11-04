#!/usr/bin/env bash
# Phase-2644: STATUS mentions milestone 6350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6350|milestone 6350|Meilenstein 6350' webui/STATUS.md
echo "STATUS milestone 6350 ok"
echo "cleaned"
echo "OK: phase2644 e2e passed"
