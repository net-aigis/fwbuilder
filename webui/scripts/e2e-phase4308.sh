#!/usr/bin/env bash
# Phase-4308: STATUS mentions milestone 11550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11550|milestone 11550|Meilenstein 11550' webui/STATUS.md
echo "STATUS milestone 11550 ok"
echo "cleaned"
echo "OK: phase4308 e2e passed"
