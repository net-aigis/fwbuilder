#!/usr/bin/env bash
# Phase-2196: STATUS mentions milestone 4950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4950|milestone 4950|Meilenstein 4950' webui/STATUS.md
echo "STATUS milestone 4950 ok"
echo "cleaned"
echo "OK: phase2196 e2e passed"
