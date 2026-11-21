#!/usr/bin/env bash
# Phase-4180: STATUS mentions milestone 11150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11150|milestone 11150|Meilenstein 11150' webui/STATUS.md
echo "STATUS milestone 11150 ok"
echo "cleaned"
echo "OK: phase4180 e2e passed"
