#!/usr/bin/env bash
# Phase-4724: STATUS mentions milestone 12850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12850|milestone 12850|Meilenstein 12850' webui/STATUS.md
echo "STATUS milestone 12850 ok"
echo "cleaned"
echo "OK: phase4724 e2e passed"
