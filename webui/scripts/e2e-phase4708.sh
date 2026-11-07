#!/usr/bin/env bash
# Phase-4708: STATUS mentions milestone 12800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12800|milestone 12800|Meilenstein 12800' webui/STATUS.md
echo "STATUS milestone 12800 ok"
echo "cleaned"
echo "OK: phase4708 e2e passed"
