#!/usr/bin/env bash
# Phase-3732: STATUS mentions milestone 9750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9750|milestone 9750|Meilenstein 9750' webui/STATUS.md
echo "STATUS milestone 9750 ok"
echo "cleaned"
echo "OK: phase3732 e2e passed"
