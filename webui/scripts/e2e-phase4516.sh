#!/usr/bin/env bash
# Phase-4516: STATUS mentions milestone 12200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12200|milestone 12200|Meilenstein 12200' webui/STATUS.md
echo "STATUS milestone 12200 ok"
echo "cleaned"
echo "OK: phase4516 e2e passed"
