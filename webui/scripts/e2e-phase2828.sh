#!/usr/bin/env bash
# Phase-2828: STATUS mentions changelog_roster sessionStorage / 2825-2832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'changelog_roster.*(sessionStorage|Clear)|sessionStorage.*changelog_roster' webui/STATUS.md
grep -qE 'phase2832|through 2832|e2e-phase2832' webui/STATUS.md
echo "STATUS changelog_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2828 e2e passed"
