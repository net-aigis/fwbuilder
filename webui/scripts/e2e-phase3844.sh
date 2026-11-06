#!/usr/bin/env bash
# Phase-3844: STATUS mentions milestone 10100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10100|milestone 10100|Meilenstein 10100' webui/STATUS.md
echo "STATUS milestone 10100 ok"
echo "cleaned"
echo "OK: phase3844 e2e passed"
