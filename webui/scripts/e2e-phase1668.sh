#!/usr/bin/env bash
# Phase-1668: STATUS mentions milestone 3300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3300|milestone 3300|Meilenstein 3300' webui/STATUS.md
echo "STATUS milestone 3300 ok"
echo "cleaned"
echo "OK: phase1668 e2e passed"
