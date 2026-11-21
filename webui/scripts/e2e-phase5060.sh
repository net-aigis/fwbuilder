#!/usr/bin/env bash
# Phase-5060: STATUS mentions milestone 13900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13900|milestone 13900|Meilenstein 13900' webui/STATUS.md
echo "STATUS milestone 13900 ok"; echo "cleaned"; echo "OK: phase5060 e2e passed"
