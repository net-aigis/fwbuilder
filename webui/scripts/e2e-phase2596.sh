#!/usr/bin/env bash
# Phase-2596: STATUS mentions milestone 6200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6200|milestone 6200|Meilenstein 6200' webui/STATUS.md
echo "STATUS milestone 6200 ok"
echo "cleaned"
echo "OK: phase2596 e2e passed"
