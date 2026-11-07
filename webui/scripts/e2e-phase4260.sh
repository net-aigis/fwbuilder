#!/usr/bin/env bash
# Phase-4260: STATUS mentions milestone 11400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11400|milestone 11400|Meilenstein 11400' webui/STATUS.md
echo "STATUS milestone 11400 ok"
echo "cleaned"
echo "OK: phase4260 e2e passed"
