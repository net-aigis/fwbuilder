#!/usr/bin/env bash
# Phase-2900: STATUS mentions milestone 7150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7150|milestone 7150|Meilenstein 7150' webui/STATUS.md
echo "STATUS milestone 7150 ok"
echo "cleaned"
echo "OK: phase2900 e2e passed"
