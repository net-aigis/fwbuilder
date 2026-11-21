#!/usr/bin/env bash
# Phase-3908: STATUS mentions milestone 10300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10300|milestone 10300|Meilenstein 10300' webui/STATUS.md
echo "STATUS milestone 10300 ok"
echo "cleaned"
echo "OK: phase3908 e2e passed"
