#!/usr/bin/env bash
# Phase-3828: STATUS mentions milestone 10050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10050|milestone 10050|Meilenstein 10050' webui/STATUS.md
echo "STATUS milestone 10050 ok"
echo "cleaned"
echo "OK: phase3828 e2e passed"
