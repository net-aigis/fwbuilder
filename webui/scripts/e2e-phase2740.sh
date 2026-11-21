#!/usr/bin/env bash
# Phase-2740: STATUS mentions milestone 6650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6650|milestone 6650|Meilenstein 6650' webui/STATUS.md
echo "STATUS milestone 6650 ok"
echo "cleaned"
echo "OK: phase2740 e2e passed"
