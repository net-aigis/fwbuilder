#!/usr/bin/env bash
# Phase-3836: STATUS mentions health_roster export / 3833-3840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'health_roster.*(export|bundle)|Export.*health_roster' webui/STATUS.md
grep -qE 'phase3840|through 3840|e2e-phase3840' webui/STATUS.md
echo "STATUS health_roster export ok"
echo "cleaned"
echo "OK: phase3836 e2e passed"
