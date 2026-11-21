#!/usr/bin/env bash
# Phase-4484: STATUS mentions milestone 12100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12100|milestone 12100|Meilenstein 12100' webui/STATUS.md
echo "STATUS milestone 12100 ok"
echo "cleaned"
echo "OK: phase4484 e2e passed"
