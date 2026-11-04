#!/usr/bin/env bash
# Phase-2556: STATUS mentions honesty_export_roster export / 2553-2560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_export_roster.*(export|bundle)|export.*honesty_export_roster|bundle.*honesty_export_roster' webui/STATUS.md
grep -qE 'phase2560|through 2560|e2e-phase2560' webui/STATUS.md
echo "STATUS honesty_export_roster export ok"
echo "cleaned"
echo "OK: phase2556 e2e passed"
