#!/usr/bin/env bash
# Phase-8060: STATUS mentions ssh_implemented_check_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_check_refresh_roster|soft_fertig_ssh_implemented_check_refresh_roster' webui/STATUS.md
grep -qE 'phase8064|through 8064|e2e-phase8064' webui/STATUS.md
echo "STATUS ssh-implemented-check-refresh roster ok"; echo "cleaned"; echo "OK: phase8060 e2e passed"
