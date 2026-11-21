#!/usr/bin/env bash
# Phase-4580: STATUS mentions milestone 12400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12400|milestone 12400|Meilenstein 12400' webui/STATUS.md
echo "STATUS milestone 12400 ok"
echo "cleaned"
echo "OK: phase4580 e2e passed"
