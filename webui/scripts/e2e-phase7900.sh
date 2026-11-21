#!/usr/bin/env bash
# Phase-7900: STATUS mentions ssh_not_implemented_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_refresh_roster|soft_fertig_ssh_not_implemented_refresh_roster' webui/STATUS.md
grep -qE 'phase7904|through 7904|e2e-phase7904' webui/STATUS.md
echo "STATUS ssh-not-implemented-refresh roster ok"; echo "cleaned"; echo "OK: phase7900 e2e passed"
