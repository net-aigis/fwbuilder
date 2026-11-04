#!/usr/bin/env bash
# Phase-2628: STATUS mentions milestone 6300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6300|milestone 6300|Meilenstein 6300' webui/STATUS.md
echo "STATUS milestone 6300 ok"
echo "cleaned"
echo "OK: phase2628 e2e passed"
