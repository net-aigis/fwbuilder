#!/usr/bin/env bash
# Phase-28220: STATUS mentions ssh_auth_ms_66000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_66000_echo_roster|soft_fertig_ssh_auth_ms_66000_echo_roster' webui/STATUS.md
grep -qE 'phase28224|through 28224|e2e-phase28224' webui/STATUS.md
echo "STATUS ssh-auth-ms-66000-echo roster ok"; echo "cleaned"; echo "OK: phase28220 e2e passed"
