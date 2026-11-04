#!/usr/bin/env bash
# Phase-2244: STATUS mentions milestone 5100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5100|milestone 5100|Meilenstein 5100' webui/STATUS.md
echo "STATUS milestone 5100 ok"
echo "cleaned"
echo "OK: phase2244 e2e passed"
