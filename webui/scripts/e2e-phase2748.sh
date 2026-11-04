#!/usr/bin/env bash
# Phase-2748: STATUS mentions surface_roster sessionStorage / 2745-2752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface_roster.*(sessionStorage|Clear)|sessionStorage.*surface_roster' webui/STATUS.md
grep -qE 'phase2752|through 2752|e2e-phase2752' webui/STATUS.md
echo "STATUS surface_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2748 e2e passed"
