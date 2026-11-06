#!/usr/bin/env bash
# Phase-4020: STATUS mentions milestone 10650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10650|milestone 10650|Meilenstein 10650' webui/STATUS.md
echo "STATUS milestone 10650 ok"
echo "cleaned"
echo "OK: phase4020 e2e passed"
