#!/usr/bin/env bash
# Phase-2716: STATUS mentions surface_roster export / 2713-2720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface_roster.*(export|bundle)|export.*surface_roster|bundle.*surface_roster' webui/STATUS.md
grep -qE 'phase2720|through 2720|e2e-phase2720' webui/STATUS.md
echo "STATUS surface_roster export ok"
echo "cleaned"
echo "OK: phase2716 e2e passed"
