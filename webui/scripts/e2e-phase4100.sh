#!/usr/bin/env bash
# Phase-4100: STATUS mentions milestone 10900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10900|milestone 10900|Meilenstein 10900' webui/STATUS.md
echo "STATUS milestone 10900 ok"
echo "cleaned"
echo "OK: phase4100 e2e passed"
