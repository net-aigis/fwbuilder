#!/usr/bin/env bash
# Phase-3812: STATUS mentions milestone 10000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10000|milestone 10000|Meilenstein 10000' webui/STATUS.md
echo "STATUS milestone 10000 ok"
echo "cleaned"
echo "OK: phase3812 e2e passed"
