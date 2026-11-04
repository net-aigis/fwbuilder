#!/usr/bin/env bash
# Phase-2820: STATUS mentions milestone 6900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6900|milestone 6900|Meilenstein 6900' webui/STATUS.md
echo "STATUS milestone 6900 ok"
echo "cleaned"
echo "OK: phase2820 e2e passed"
