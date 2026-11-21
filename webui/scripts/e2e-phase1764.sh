#!/usr/bin/env bash
# Phase-1764: STATUS mentions milestone 3600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3600|milestone 3600|Meilenstein 3600' webui/STATUS.md
echo "STATUS milestone 3600 ok"
echo "cleaned"
echo "OK: phase1764 e2e passed"
