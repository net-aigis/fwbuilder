#!/usr/bin/env bash
# Phase-2308: STATUS mentions milestone 5300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5300|milestone 5300|Meilenstein 5300' webui/STATUS.md
echo "STATUS milestone 5300 ok"
echo "cleaned"
echo "OK: phase2308 e2e passed"
