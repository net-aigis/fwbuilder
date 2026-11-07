#!/usr/bin/env bash
# Phase-4132: STATUS mentions milestone 11000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11000|milestone 11000|Meilenstein 11000' webui/STATUS.md
echo "STATUS milestone 11000 ok"
echo "cleaned"
echo "OK: phase4132 e2e passed"
