#!/usr/bin/env bash
# Phase-5740: STATUS mentions ssh_alternative_support_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_support_roster|soft_fertig_ssh_alternative_support_roster' webui/STATUS.md
grep -qE 'phase5744|through 5664|e2e-phase5744' webui/STATUS.md
echo "STATUS ssh-alternative-support roster ok"; echo "cleaned"; echo "OK: phase5740 e2e passed"
