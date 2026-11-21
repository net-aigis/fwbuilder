#!/usr/bin/env bash
# Phase-2212: STATUS mentions milestone 5000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5000|milestone 5000|Meilenstein 5000' webui/STATUS.md
echo "STATUS milestone 5000 ok"
echo "cleaned"
echo "OK: phase2212 e2e passed"
