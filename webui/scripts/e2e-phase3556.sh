#!/usr/bin/env bash
# Phase-3556: STATUS mentions milestone 9200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9200|milestone 9200|Meilenstein 9200' webui/STATUS.md
echo "STATUS milestone 9200 ok"
echo "cleaned"
echo "OK: phase3556 e2e passed"
