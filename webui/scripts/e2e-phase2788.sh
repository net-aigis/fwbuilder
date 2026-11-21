#!/usr/bin/env bash
# Phase-2788: STATUS mentions milestone 6800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6800|milestone 6800|Meilenstein 6800' webui/STATUS.md
echo "STATUS milestone 6800 ok"
echo "cleaned"
echo "OK: phase2788 e2e passed"
