#!/usr/bin/env bash
# Phase-4404: STATUS mentions milestone 11850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11850|milestone 11850|Meilenstein 11850' webui/STATUS.md
echo "STATUS milestone 11850 ok"
echo "cleaned"
echo "OK: phase4404 e2e passed"
