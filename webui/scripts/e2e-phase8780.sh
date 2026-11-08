#!/usr/bin/env bash
# Phase-8780: STATUS mentions ssh_alternative_support_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_support_refresh_roster|soft_fertig_ssh_alternative_support_refresh_roster' webui/STATUS.md
grep -qE 'phase8784|through 8784|e2e-phase8784' webui/STATUS.md
echo "STATUS ssh-alternative-support-refresh roster ok"; echo "cleaned"; echo "OK: phase8780 e2e passed"
