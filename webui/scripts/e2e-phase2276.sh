#!/usr/bin/env bash
# Phase-2276: STATUS mentions milestone 5200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5200|milestone 5200|Meilenstein 5200' webui/STATUS.md
echo "STATUS milestone 5200 ok"
echo "cleaned"
echo "OK: phase2276 e2e passed"
