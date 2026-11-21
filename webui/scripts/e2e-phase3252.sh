#!/usr/bin/env bash
# Phase-3252: STATUS mentions milestone 8250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8250|milestone 8250|Meilenstein 8250' webui/STATUS.md
echo "STATUS milestone 8250 ok"
echo "cleaned"
echo "OK: phase3252 e2e passed"
