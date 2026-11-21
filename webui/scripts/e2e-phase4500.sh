#!/usr/bin/env bash
# Phase-4500: STATUS mentions milestone 12150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12150|milestone 12150|Meilenstein 12150' webui/STATUS.md
echo "STATUS milestone 12150 ok"
echo "cleaned"
echo "OK: phase4500 e2e passed"
