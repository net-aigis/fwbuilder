#!/usr/bin/env bash
# Phase-4236: STATUS mentions option_enable_roster export / 4233-4240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'option_enable_roster.*(export|bundle)|Export.*option_enable_roster' webui/STATUS.md
grep -qE 'phase4240|through 4240|e2e-phase4240' webui/STATUS.md
echo "STATUS option_enable_roster export ok"
echo "cleaned"
echo "OK: phase4236 e2e passed"
