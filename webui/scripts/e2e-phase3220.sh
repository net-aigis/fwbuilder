#!/usr/bin/env bash
# Phase-3220: STATUS mentions milestone 8150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8150|milestone 8150|Meilenstein 8150' webui/STATUS.md
echo "STATUS milestone 8150 ok"
echo "cleaned"
echo "OK: phase3220 e2e passed"
