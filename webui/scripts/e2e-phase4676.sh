#!/usr/bin/env bash
# Phase-4676: STATUS mentions milestone 12700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12700|milestone 12700|Meilenstein 12700' webui/STATUS.md
echo "STATUS milestone 12700 ok"
echo "cleaned"
echo "OK: phase4676 e2e passed"
