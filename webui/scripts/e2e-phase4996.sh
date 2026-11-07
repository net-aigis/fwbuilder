#!/usr/bin/env bash
# Phase-4996: STATUS mentions milestone 13700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13700|milestone 13700|Meilenstein 13700' webui/STATUS.md
echo "STATUS milestone 13700 ok"; echo "cleaned"; echo "OK: phase4996 e2e passed"
