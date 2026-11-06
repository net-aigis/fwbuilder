#!/usr/bin/env bash
# Phase-3540: STATUS mentions milestone 9150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9150|milestone 9150|Meilenstein 9150' webui/STATUS.md
echo "STATUS milestone 9150 ok"
echo "cleaned"
echo "OK: phase3540 e2e passed"
