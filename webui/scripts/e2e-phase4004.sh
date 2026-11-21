#!/usr/bin/env bash
# Phase-4004: STATUS mentions milestone 10600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10600|milestone 10600|Meilenstein 10600' webui/STATUS.md
echo "STATUS milestone 10600 ok"
echo "cleaned"
echo "OK: phase4004 e2e passed"
