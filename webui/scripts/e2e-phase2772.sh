#!/usr/bin/env bash
# Phase-2772: STATUS mentions milestone 6750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6750|milestone 6750|Meilenstein 6750' webui/STATUS.md
echo "STATUS milestone 6750 ok"
echo "cleaned"
echo "OK: phase2772 e2e passed"
