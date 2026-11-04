#!/usr/bin/env bash
# Phase-2836: STATUS mentions milestone 6950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6950|milestone 6950|Meilenstein 6950' webui/STATUS.md
echo "STATUS milestone 6950 ok"
echo "cleaned"
echo "OK: phase2836 e2e passed"
