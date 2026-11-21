#!/usr/bin/env bash
# Phase-2140: STATUS mentions honesty operator brief / 2137-2144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'operator_brief|operator brief' webui/STATUS.md
grep -qE 'phase2144|through 2144|e2e-phase2144' webui/STATUS.md
echo "STATUS honesty operator brief ok"
echo "cleaned"
echo "OK: phase2140 e2e passed"
