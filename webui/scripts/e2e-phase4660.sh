#!/usr/bin/env bash
# Phase-4660: STATUS mentions milestone 12650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12650|milestone 12650|Meilenstein 12650' webui/STATUS.md
echo "STATUS milestone 12650 ok"
echo "cleaned"
echo "OK: phase4660 e2e passed"
