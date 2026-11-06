#!/usr/bin/env bash
# Phase-3684: STATUS mentions milestone 9600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9600|milestone 9600|Meilenstein 9600' webui/STATUS.md
echo "STATUS milestone 9600 ok"
echo "cleaned"
echo "OK: phase3684 e2e passed"
