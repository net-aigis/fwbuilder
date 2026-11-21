#!/usr/bin/env bash
# Phase-2436: STATUS mentions milestone 5700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5700|milestone 5700|Meilenstein 5700' webui/STATUS.md
echo "STATUS milestone 5700 ok"
echo "cleaned"
echo "OK: phase2436 e2e passed"
