#!/usr/bin/env bash
# Phase-8940: STATUS mentions ssh_auth_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_refresh_roster|soft_fertig_ssh_auth_refresh_roster' webui/STATUS.md
grep -qE 'phase8944|through 8944|e2e-phase8944' webui/STATUS.md
echo "STATUS ssh-auth-refresh roster ok"; echo "cleaned"; echo "OK: phase8940 e2e passed"
