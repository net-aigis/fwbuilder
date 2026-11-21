#!/usr/bin/env bash
# Phase-4276: STATUS mentions milestone 11450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11450|milestone 11450|Meilenstein 11450' webui/STATUS.md
echo "STATUS milestone 11450 ok"
echo "cleaned"
echo "OK: phase4276 e2e passed"
