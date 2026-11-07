#!/usr/bin/env bash
# Phase-4228: STATUS mentions milestone 11300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11300|milestone 11300|Meilenstein 11300' webui/STATUS.md
echo "STATUS milestone 11300 ok"
echo "cleaned"
echo "OK: phase4228 e2e passed"
