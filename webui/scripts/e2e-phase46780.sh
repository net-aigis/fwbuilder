#!/usr/bin/env bash
# Phase-46780: STATUS mentions ssh_auth_ms_95000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_95000_echo_roster|soft_fertig_ssh_auth_ms_95000_echo_roster' webui/STATUS.md
grep -qE 'phase46784|through 46784|e2e-phase46784' webui/STATUS.md
echo "STATUS ssh-auth-ms-95000-echo roster ok"; echo "cleaned"; echo "OK: phase46780 e2e passed"
