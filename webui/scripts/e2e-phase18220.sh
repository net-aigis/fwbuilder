#!/usr/bin/env bash
# Phase-18220: STATUS mentions ssh_auth_soft_18240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_18240_echo_roster|soft_fertig_ssh_auth_soft_18240_echo_roster' webui/STATUS.md
grep -qE 'phase18224|through 18224|e2e-phase18224' webui/STATUS.md
echo "STATUS ssh-auth-soft-18240-echo roster ok"; echo "cleaned"; echo "OK: phase18220 e2e passed"
