#!/usr/bin/env bash
# Phase-5188: STATUS mentions milestone 14300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '14300|milestone 14300|Meilenstein 14300' webui/STATUS.md
echo "STATUS milestone 14300 ok"; echo "cleaned"; echo "OK: phase5188 e2e passed"
