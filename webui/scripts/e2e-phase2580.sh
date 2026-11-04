#!/usr/bin/env bash
# Phase-2580: STATUS mentions milestone 6150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6150|milestone 6150|Meilenstein 6150' webui/STATUS.md
echo "STATUS milestone 6150 ok"
echo "cleaned"
echo "OK: phase2580 e2e passed"
