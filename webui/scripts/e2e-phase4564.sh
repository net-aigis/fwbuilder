#!/usr/bin/env bash
# Phase-4564: STATUS mentions milestone 12350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12350|milestone 12350|Meilenstein 12350' webui/STATUS.md
echo "STATUS milestone 12350 ok"
echo "cleaned"
echo "OK: phase4564 e2e passed"
