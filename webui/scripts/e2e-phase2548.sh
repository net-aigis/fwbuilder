#!/usr/bin/env bash
# Phase-2548: STATUS mentions milestone 6050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6050|milestone 6050|Meilenstein 6050' webui/STATUS.md
echo "STATUS milestone 6050 ok"
echo "cleaned"
echo "OK: phase2548 e2e passed"
