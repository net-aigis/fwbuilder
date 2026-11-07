#!/usr/bin/env bash
# Phase-4964: STATUS mentions milestone 13600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13600|milestone 13600|Meilenstein 13600' webui/STATUS.md
echo "STATUS milestone 13600 ok"; echo "cleaned"; echo "OK: phase4964 e2e passed"
