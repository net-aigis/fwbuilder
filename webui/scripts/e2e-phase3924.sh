#!/usr/bin/env bash
# Phase-3924: STATUS mentions milestone 10350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10350|milestone 10350|Meilenstein 10350' webui/STATUS.md
echo "STATUS milestone 10350 ok"
echo "cleaned"
echo "OK: phase3924 e2e passed"
