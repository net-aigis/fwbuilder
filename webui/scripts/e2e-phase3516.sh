#!/usr/bin/env bash
# Phase-3516: STATUS mentions honesty_operator_brief_roster export / 3513-3520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_operator_brief_roster.*(export|bundle)|Export.*honesty_operator_brief_roster' webui/STATUS.md
grep -qE 'phase3520|through 3520|e2e-phase3520' webui/STATUS.md
echo "STATUS honesty_operator_brief_roster export ok"
echo "cleaned"
echo "OK: phase3516 e2e passed"
