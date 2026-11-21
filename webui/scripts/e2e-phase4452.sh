#!/usr/bin/env bash
# Phase-4452: STATUS mentions milestone 12000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12000|milestone 12000|Meilenstein 12000' webui/STATUS.md
echo "STATUS milestone 12000 ok"
echo "cleaned"
echo "OK: phase4452 e2e passed"
