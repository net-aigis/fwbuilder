#!/usr/bin/env bash
# Phase-3876: STATUS mentions milestone 10200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10200|milestone 10200|Meilenstein 10200' webui/STATUS.md
echo "STATUS milestone 10200 ok"
echo "cleaned"
echo "OK: phase3876 e2e passed"
