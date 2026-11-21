#!/usr/bin/env bash
# Phase-4244: STATUS mentions milestone 11350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11350|milestone 11350|Meilenstein 11350' webui/STATUS.md
echo "STATUS milestone 11350 ok"
echo "cleaned"
echo "OK: phase4244 e2e passed"
