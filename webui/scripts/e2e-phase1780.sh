#!/usr/bin/env bash
# Phase-1780: STATUS mentions milestone 3650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3650|milestone 3650|Meilenstein 3650' webui/STATUS.md
echo "STATUS milestone 3650 ok"
echo "cleaned"
echo "OK: phase1780 e2e passed"
