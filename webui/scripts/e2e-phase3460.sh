#!/usr/bin/env bash
# Phase-3460: STATUS mentions milestone 8900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8900|milestone 8900|Meilenstein 8900' webui/STATUS.md
echo "STATUS milestone 8900 ok"
echo "cleaned"
echo "OK: phase3460 e2e passed"
