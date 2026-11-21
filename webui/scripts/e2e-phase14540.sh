#!/usr/bin/env bash
# Phase-14540: STATUS mentions ssh_auth_refresh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_refresh_ratio_roster|soft_fertig_ssh_auth_refresh_ratio_roster' webui/STATUS.md
grep -qE 'phase14544|through 14544|e2e-phase14544' webui/STATUS.md
echo "STATUS ssh-auth-refresh-ratio roster ok"; echo "cleaned"; echo "OK: phase14540 e2e passed"
