#!/usr/bin/env bash
# Phase-2932: STATUS mentions milestone 7250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7250|milestone 7250|Meilenstein 7250' webui/STATUS.md
echo "STATUS milestone 7250 ok"
echo "cleaned"
echo "OK: phase2932 e2e passed"
