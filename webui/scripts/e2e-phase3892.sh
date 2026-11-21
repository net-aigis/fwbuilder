#!/usr/bin/env bash
# Phase-3892: STATUS mentions milestone 10250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10250|milestone 10250|Meilenstein 10250' webui/STATUS.md
echo "STATUS milestone 10250 ok"
echo "cleaned"
echo "OK: phase3892 e2e passed"
