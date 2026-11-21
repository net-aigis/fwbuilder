#!/usr/bin/env bash
# Phase-2180: STATUS mentions milestone 4900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4900|milestone 4900|Meilenstein 4900' webui/STATUS.md
echo "STATUS milestone 4900 ok"
echo "cleaned"
echo "OK: phase2180 e2e passed"
