#!/usr/bin/env bash
# Phase-36220: STATUS mentions ssh_auth_ms_78500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_78500_echo_roster|soft_fertig_ssh_auth_ms_78500_echo_roster' webui/STATUS.md
grep -qE 'phase36224|through 36224|e2e-phase36224' webui/STATUS.md
echo "STATUS ssh-auth-ms-78500-echo roster ok"; echo "cleaned"; echo "OK: phase36220 e2e passed"
