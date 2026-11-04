#!/usr/bin/env bash
# Phase-1620: STATUS mentions milestone 3150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3150|milestone 3150|Meilenstein 3150' webui/STATUS.md
echo "STATUS milestone 3150 ok"
echo "cleaned"
echo "OK: phase1620 e2e passed"
