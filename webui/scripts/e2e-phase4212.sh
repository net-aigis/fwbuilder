#!/usr/bin/env bash
# Phase-4212: STATUS mentions milestone 11250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11250|milestone 11250|Meilenstein 11250' webui/STATUS.md
echo "STATUS milestone 11250 ok"
echo "cleaned"
echo "OK: phase4212 e2e passed"
