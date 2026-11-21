#!/usr/bin/env bash
# Phase-2852: STATUS mentions milestone 7000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7000|milestone 7000|Meilenstein 7000' webui/STATUS.md
echo "STATUS milestone 7000 ok"
echo "cleaned"
echo "OK: phase2852 e2e passed"
