#!/usr/bin/env bash
# Phase-3308: STATUS mentions catalog_summary_roster sessionStorage / 3305-3312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'catalog_summary_roster.*(sessionStorage|Clear)|sessionStorage.*catalog_summary_roster' webui/STATUS.md
grep -qE 'phase3312|through 3312|e2e-phase3312' webui/STATUS.md
echo "STATUS catalog_summary_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3308 e2e passed"
