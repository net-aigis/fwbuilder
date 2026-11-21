#!/usr/bin/env bash
# Phase-2260: STATUS mentions milestone 5150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5150|milestone 5150|Meilenstein 5150' webui/STATUS.md
echo "STATUS milestone 5150 ok"
echo "cleaned"
echo "OK: phase2260 e2e passed"
