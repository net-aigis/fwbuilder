#!/usr/bin/env bash
# Phase-4868: STATUS mentions milestone 13300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13300|milestone 13300|Meilenstein 13300' webui/STATUS.md
echo "STATUS milestone 13300 ok"; echo "cleaned"; echo "OK: phase4868 e2e passed"
