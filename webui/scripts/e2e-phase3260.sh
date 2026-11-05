#!/usr/bin/env bash
# Phase-3260: STATUS mentions catalog_summary_roster / 3257-3264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'catalog_summary_roster|soft_fertig_catalog_summary_roster' webui/STATUS.md
grep -qE 'phase3264|through 3264|e2e-phase3264' webui/STATUS.md
echo "STATUS catalog summary roster ok"
echo "cleaned"
echo "OK: phase3260 e2e passed"
