#!/usr/bin/env bash
# Phase-5012: STATUS mentions milestone 13750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13750|milestone 13750|Meilenstein 13750' webui/STATUS.md
echo "STATUS milestone 13750 ok"; echo "cleaned"; echo "OK: phase5012 e2e passed"
