#!/usr/bin/env bash
# Phase-2020: STATUS mentions milestone 4400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4400|milestone 4400|Meilenstein 4400' webui/STATUS.md
echo "STATUS milestone 4400 ok"
echo "cleaned"
echo "OK: phase2020 e2e passed"
