#!/usr/bin/env bash
# Phase-3548: STATUS mentions honesty_operator_brief_roster sessionStorage / 3545-3552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_operator_brief_roster.*(sessionStorage|Clear)|sessionStorage.*honesty_operator_brief_roster' webui/STATUS.md
grep -qE 'phase3552|through 3552|e2e-phase3552' webui/STATUS.md
echo "STATUS honesty_operator_brief_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3548 e2e passed"
