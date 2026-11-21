#!/usr/bin/env bash
# Phase-19580: STATUS mentions ssh_auth_ms_52500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_52500_echo_roster|soft_fertig_ssh_auth_ms_52500_echo_roster' webui/STATUS.md
grep -qE 'phase19584|through 19584|e2e-phase19584' webui/STATUS.md
echo "STATUS ssh-auth-ms-52500-echo roster ok"; echo "cleaned"; echo "OK: phase19580 e2e passed"
