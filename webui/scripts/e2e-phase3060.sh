#!/usr/bin/env bash
# Phase-3060: STATUS mentions milestone 7650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7650|milestone 7650|Meilenstein 7650' webui/STATUS.md
echo "STATUS milestone 7650 ok"
echo "cleaned"
echo "OK: phase3060 e2e passed"
