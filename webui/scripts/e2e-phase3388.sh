#!/usr/bin/env bash
# Phase-3388: STATUS mentions honesty_readiness_roster sessionStorage / 3385-3392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_readiness_roster.*(sessionStorage|Clear)|sessionStorage.*honesty_readiness_roster' webui/STATUS.md
grep -qE 'phase3392|through 3392|e2e-phase3392' webui/STATUS.md
echo "STATUS honesty_readiness_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3388 e2e passed"
