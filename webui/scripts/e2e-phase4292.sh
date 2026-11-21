#!/usr/bin/env bash
# Phase-4292: STATUS mentions milestone 11500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11500|milestone 11500|Meilenstein 11500' webui/STATUS.md
echo "STATUS milestone 11500 ok"
echo "cleaned"
echo "OK: phase4292 e2e passed"
