#!/usr/bin/env bash
# Phase-3268: STATUS mentions milestone 8300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8300|milestone 8300|Meilenstein 8300' webui/STATUS.md
echo "STATUS milestone 8300 ok"
echo "cleaned"
echo "OK: phase3268 e2e passed"
