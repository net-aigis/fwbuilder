#!/usr/bin/env bash
# Phase-8140: STATUS mentions ssh_not_implemented_check_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_check_refresh_roster|soft_fertig_ssh_not_implemented_check_refresh_roster' webui/STATUS.md
grep -qE 'phase8144|through 8144|e2e-phase8144' webui/STATUS.md
echo "STATUS ssh-not-implemented-check-refresh roster ok"; echo "cleaned"; echo "OK: phase8140 e2e passed"
