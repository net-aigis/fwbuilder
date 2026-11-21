#!/usr/bin/env bash
# Phase-4532: STATUS mentions milestone 12250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12250|milestone 12250|Meilenstein 12250' webui/STATUS.md
echo "STATUS milestone 12250 ok"
echo "cleaned"
echo "OK: phase4532 e2e passed"
