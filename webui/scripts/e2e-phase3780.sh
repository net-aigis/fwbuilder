#!/usr/bin/env bash
# Phase-3780: STATUS mentions milestone 9900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9900|milestone 9900|Meilenstein 9900' webui/STATUS.md
echo "STATUS milestone 9900 ok"
echo "cleaned"
echo "OK: phase3780 e2e passed"
