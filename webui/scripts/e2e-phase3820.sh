#!/usr/bin/env bash
# Phase-3820: STATUS mentions health_roster / 3817-3824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'health_roster|soft_fertig_health_roster' webui/STATUS.md
grep -qE 'phase3824|through 3824|e2e-phase3824' webui/STATUS.md
echo "STATUS health roster ok"
echo "cleaned"
echo "OK: phase3820 e2e passed"
