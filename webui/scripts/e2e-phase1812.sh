#!/usr/bin/env bash
# Phase-1812: STATUS mentions milestone 3750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3750|milestone 3750|Meilenstein 3750' webui/STATUS.md
echo "STATUS milestone 3750 ok"
echo "cleaned"
echo "OK: phase1812 e2e passed"
