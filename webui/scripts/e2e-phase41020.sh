#!/usr/bin/env bash
# Phase-41020: STATUS mentions ssh_auth_ms_86000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_86000_echo_roster|soft_fertig_ssh_auth_ms_86000_echo_roster' webui/STATUS.md
grep -qE 'phase41024|through 41024|e2e-phase41024' webui/STATUS.md
echo "STATUS ssh-auth-ms-86000-echo roster ok"; echo "cleaned"; echo "OK: phase41020 e2e passed"
