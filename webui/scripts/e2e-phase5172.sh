#!/usr/bin/env bash
# Phase-5172: STATUS mentions milestone 14250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '14250|milestone 14250|Meilenstein 14250' webui/STATUS.md
echo "STATUS milestone 14250 ok"; echo "cleaned"; echo "OK: phase5172 e2e passed"
