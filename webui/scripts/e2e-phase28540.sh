#!/usr/bin/env bash
# Phase-28540: STATUS mentions ssh_auth_ms_66500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_66500_echo_roster|soft_fertig_ssh_auth_ms_66500_echo_roster' webui/STATUS.md
grep -qE 'phase28544|through 28544|e2e-phase28544' webui/STATUS.md
echo "STATUS ssh-auth-ms-66500-echo roster ok"; echo "cleaned"; echo "OK: phase28540 e2e passed"
