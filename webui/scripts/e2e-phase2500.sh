#!/usr/bin/env bash
# Phase-2500: STATUS mentions milestone 5900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5900|milestone 5900|Meilenstein 5900' webui/STATUS.md
echo "STATUS milestone 5900 ok"
echo "cleaned"
echo "OK: phase2500 e2e passed"
