#!/usr/bin/env bash
# Phase-2588: STATUS mentions honesty_export_roster sessionStorage / 2585-2592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_export_roster.*(sessionStorage|Clear)|sessionStorage.*honesty_export_roster' webui/STATUS.md
grep -qE 'phase2592|through 2592|e2e-phase2592' webui/STATUS.md
echo "STATUS honesty_export_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2588 e2e passed"
