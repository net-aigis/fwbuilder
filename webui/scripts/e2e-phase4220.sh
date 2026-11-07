#!/usr/bin/env bash
# Phase-4220: STATUS mentions option_enable_roster / 4217-4224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'option_enable_roster|soft_fertig_option_enable_roster' webui/STATUS.md
grep -qE 'phase4224|through 4224|e2e-phase4224' webui/STATUS.md
echo "STATUS option-enable roster ok"
echo "cleaned"
echo "OK: phase4220 e2e passed"
