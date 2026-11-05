#!/usr/bin/env bash
# Phase-3412: STATUS mentions milestone 8750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8750|milestone 8750|Meilenstein 8750' webui/STATUS.md
echo "STATUS milestone 8750 ok"
echo "cleaned"
echo "OK: phase3412 e2e passed"
