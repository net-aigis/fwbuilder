#!/usr/bin/env bash
# Phase-4644: STATUS mentions milestone 12600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12600|milestone 12600|Meilenstein 12600' webui/STATUS.md
echo "STATUS milestone 12600 ok"
echo "cleaned"
echo "OK: phase4644 e2e passed"
