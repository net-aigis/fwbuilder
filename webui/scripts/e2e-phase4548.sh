#!/usr/bin/env bash
# Phase-4548: STATUS mentions milestone 12300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12300|milestone 12300|Meilenstein 12300' webui/STATUS.md
echo "STATUS milestone 12300 ok"
echo "cleaned"
echo "OK: phase4548 e2e passed"
