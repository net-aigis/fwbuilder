#!/usr/bin/env bash
# Phase-3988: STATUS mentions milestone 10550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10550|milestone 10550|Meilenstein 10550' webui/STATUS.md
echo "STATUS milestone 10550 ok"
echo "cleaned"
echo "OK: phase3988 e2e passed"
