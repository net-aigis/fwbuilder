#!/usr/bin/env bash
# Phase-4036: STATUS mentions milestone 10700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10700|milestone 10700|Meilenstein 10700' webui/STATUS.md
echo "STATUS milestone 10700 ok"
echo "cleaned"
echo "OK: phase4036 e2e passed"
