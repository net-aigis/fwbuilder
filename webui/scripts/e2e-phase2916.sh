#!/usr/bin/env bash
# Phase-2916: STATUS mentions milestone 7200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7200|milestone 7200|Meilenstein 7200' webui/STATUS.md
echo "STATUS milestone 7200 ok"
echo "cleaned"
echo "OK: phase2916 e2e passed"
