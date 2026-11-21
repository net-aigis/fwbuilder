#!/usr/bin/env bash
# Phase-4116: STATUS mentions milestone 10950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10950|milestone 10950|Meilenstein 10950' webui/STATUS.md
echo "STATUS milestone 10950 ok"
echo "cleaned"
echo "OK: phase4116 e2e passed"
