#!/usr/bin/env bash
# Phase-2428: STATUS mentions honesty_path_roster sessionStorage / 2425-2432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_path_roster.*(sessionStorage|Clear)|sessionStorage.*honesty_path_roster' webui/STATUS.md
grep -qE 'phase2432|through 2432|e2e-phase2432' webui/STATUS.md
echo "STATUS honesty_path_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2428 e2e passed"
