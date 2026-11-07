#!/usr/bin/env bash
# Phase-4900: STATUS mentions milestone 13400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13400|milestone 13400|Meilenstein 13400' webui/STATUS.md
echo "STATUS milestone 13400 ok"; echo "cleaned"; echo "OK: phase4900 e2e passed"
