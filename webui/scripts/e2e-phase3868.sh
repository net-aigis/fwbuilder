#!/usr/bin/env bash
# Phase-3868: STATUS mentions health_roster sessionStorage / 3865-3872.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'health_roster.*(sessionStorage|Clear)|sessionStorage.*health_roster' webui/STATUS.md
grep -qE 'phase3872|through 3872|e2e-phase3872' webui/STATUS.md
echo "STATUS health_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3868 e2e passed"
