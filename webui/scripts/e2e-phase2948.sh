#!/usr/bin/env bash
# Phase-2948: STATUS mentions milestone 7300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7300|milestone 7300|Meilenstein 7300' webui/STATUS.md
echo "STATUS milestone 7300 ok"
echo "cleaned"
echo "OK: phase2948 e2e passed"
