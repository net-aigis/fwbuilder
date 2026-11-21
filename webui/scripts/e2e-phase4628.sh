#!/usr/bin/env bash
# Phase-4628: STATUS mentions milestone 12550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12550|milestone 12550|Meilenstein 12550' webui/STATUS.md
echo "STATUS milestone 12550 ok"
echo "cleaned"
echo "OK: phase4628 e2e passed"
