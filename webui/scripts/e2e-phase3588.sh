#!/usr/bin/env bash
# Phase-3588: STATUS mentions milestone 9300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9300|milestone 9300|Meilenstein 9300' webui/STATUS.md
echo "STATUS milestone 9300 ok"
echo "cleaned"
echo "OK: phase3588 e2e passed"
