#!/usr/bin/env bash
# Phase-2484: STATUS mentions milestone 5850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5850|milestone 5850|Meilenstein 5850' webui/STATUS.md
echo "STATUS milestone 5850 ok"
echo "cleaned"
echo "OK: phase2484 e2e passed"
