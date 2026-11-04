#!/usr/bin/env bash
# Phase-2532: STATUS mentions milestone 6000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6000|milestone 6000|Meilenstein 6000' webui/STATUS.md
echo "STATUS milestone 6000 ok"
echo "cleaned"
echo "OK: phase2532 e2e passed"
