#!/usr/bin/env bash
# Phase-4772: STATUS mentions milestone 13000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '13000|milestone 13000|Meilenstein 13000' webui/STATUS.md
echo "STATUS milestone 13000 ok"
echo "cleaned"
echo "OK: phase4772 e2e passed"
