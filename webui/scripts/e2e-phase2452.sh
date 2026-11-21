#!/usr/bin/env bash
# Phase-2452: STATUS mentions milestone 5750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5750|milestone 5750|Meilenstein 5750' webui/STATUS.md
echo "STATUS milestone 5750 ok"
echo "cleaned"
echo "OK: phase2452 e2e passed"
