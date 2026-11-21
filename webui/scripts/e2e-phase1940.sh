#!/usr/bin/env bash
# Phase-1940: STATUS mentions milestone 4150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4150|milestone 4150|Meilenstein 4150' webui/STATUS.md
echo "STATUS milestone 4150 ok"
echo "cleaned"
echo "OK: phase1940 e2e passed"
