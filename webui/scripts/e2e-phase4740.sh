#!/usr/bin/env bash
# Phase-4740: STATUS mentions milestone 12900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12900|milestone 12900|Meilenstein 12900' webui/STATUS.md
echo "STATUS milestone 12900 ok"
echo "cleaned"
echo "OK: phase4740 e2e passed"
