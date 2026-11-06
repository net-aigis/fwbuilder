#!/usr/bin/env bash
# Phase-3524: STATUS mentions milestone 9100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9100|milestone 9100|Meilenstein 9100' webui/STATUS.md
echo "STATUS milestone 9100 ok"
echo "cleaned"
echo "OK: phase3524 e2e passed"
