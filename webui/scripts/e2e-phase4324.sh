#!/usr/bin/env bash
# Phase-4324: STATUS mentions milestone 11600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11600|milestone 11600|Meilenstein 11600' webui/STATUS.md
echo "STATUS milestone 11600 ok"
echo "cleaned"
echo "OK: phase4324 e2e passed"
