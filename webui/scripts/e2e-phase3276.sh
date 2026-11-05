#!/usr/bin/env bash
# Phase-3276: STATUS mentions catalog_summary_roster export / 3273-3280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'catalog_summary_roster.*(export|bundle)|Export.*catalog_summary_roster' webui/STATUS.md
grep -qE 'phase3280|through 3280|e2e-phase3280' webui/STATUS.md
echo "STATUS catalog_summary_roster export ok"
echo "cleaned"
echo "OK: phase3276 e2e passed"
