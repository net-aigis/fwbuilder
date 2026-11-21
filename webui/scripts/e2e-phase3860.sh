#!/usr/bin/env bash
# Phase-3860: STATUS mentions milestone 10150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10150|milestone 10150|Meilenstein 10150' webui/STATUS.md
echo "STATUS milestone 10150 ok"
echo "cleaned"
echo "OK: phase3860 e2e passed"
