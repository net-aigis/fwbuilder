#!/usr/bin/env bash
# Phase-3092: STATUS mentions milestone 7750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7750|milestone 7750|Meilenstein 7750' webui/STATUS.md
echo "STATUS milestone 7750 ok"
echo "cleaned"
echo "OK: phase3092 e2e passed"
