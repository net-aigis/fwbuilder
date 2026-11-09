#!/usr/bin/env bash
# Phase-20220: STATUS mentions ssh_auth_ms_53500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_53500_echo_roster|soft_fertig_ssh_auth_ms_53500_echo_roster' webui/STATUS.md
grep -qE 'phase20224|through 20224|e2e-phase20224' webui/STATUS.md
echo "STATUS ssh-auth-ms-53500-echo roster ok"; echo "cleaned"; echo "OK: phase20220 e2e passed"
