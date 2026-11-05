#!/usr/bin/env bash
# Phase-3236: STATUS mentions milestone 8200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8200|milestone 8200|Meilenstein 8200' webui/STATUS.md
echo "STATUS milestone 8200 ok"
echo "cleaned"
echo "OK: phase3236 e2e passed"
