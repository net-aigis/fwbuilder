#!/usr/bin/env bash
# Phase-4596: STATUS mentions milestone 12450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12450|milestone 12450|Meilenstein 12450' webui/STATUS.md
echo "STATUS milestone 12450 ok"
echo "cleaned"
echo "OK: phase4596 e2e passed"
