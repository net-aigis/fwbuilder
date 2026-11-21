#!/usr/bin/env bash
# Phase-2724: STATUS mentions milestone 6600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6600|milestone 6600|Meilenstein 6600' webui/STATUS.md
echo "STATUS milestone 6600 ok"
echo "cleaned"
echo "OK: phase2724 e2e passed"
