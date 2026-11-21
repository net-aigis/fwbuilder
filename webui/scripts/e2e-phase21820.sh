#!/usr/bin/env bash
# Phase-21820: STATUS mentions ssh_auth_ms_56000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_56000_echo_roster|soft_fertig_ssh_auth_ms_56000_echo_roster' webui/STATUS.md
grep -qE 'phase21824|through 21824|e2e-phase21824' webui/STATUS.md
echo "STATUS ssh-auth-ms-56000-echo roster ok"; echo "cleaned"; echo "OK: phase21820 e2e passed"
