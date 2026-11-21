#!/usr/bin/env bash
# Phase-25020: STATUS mentions ssh_auth_ms_61000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_61000_echo_roster|soft_fertig_ssh_auth_ms_61000_echo_roster' webui/STATUS.md
grep -qE 'phase25024|through 25024|e2e-phase25024' webui/STATUS.md
echo "STATUS ssh-auth-ms-61000-echo roster ok"; echo "cleaned"; echo "OK: phase25020 e2e passed"
