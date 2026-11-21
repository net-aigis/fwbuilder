#!/usr/bin/env bash
# Phase-1988: STATUS mentions milestone 4300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4300|milestone 4300|Meilenstein 4300' webui/STATUS.md
echo "STATUS milestone 4300 ok"
echo "cleaned"
echo "OK: phase1988 e2e passed"
