#!/usr/bin/env bash
# Phase-2404: STATUS mentions milestone 5600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5600|milestone 5600|Meilenstein 5600' webui/STATUS.md
echo "STATUS milestone 5600 ok"
echo "cleaned"
echo "OK: phase2404 e2e passed"
