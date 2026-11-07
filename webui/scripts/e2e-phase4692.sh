#!/usr/bin/env bash
# Phase-4692: STATUS mentions milestone 12750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12750|milestone 12750|Meilenstein 12750' webui/STATUS.md
echo "STATUS milestone 12750 ok"
echo "cleaned"
echo "OK: phase4692 e2e passed"
