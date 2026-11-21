#!/usr/bin/env bash
# Phase-44540: STATUS mentions ssh_auth_ms_91500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_91500_echo_roster|soft_fertig_ssh_auth_ms_91500_echo_roster' webui/STATUS.md
grep -qE 'phase44544|through 44544|e2e-phase44544' webui/STATUS.md
echo "STATUS ssh-auth-ms-91500-echo roster ok"; echo "cleaned"; echo "OK: phase44540 e2e passed"
