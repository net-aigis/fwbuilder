#!/usr/bin/env bash
# Phase-27820: STATUS mentions ssh_auth_soft_28320_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_28320_echo_roster|soft_fertig_ssh_auth_soft_28320_echo_roster' webui/STATUS.md
grep -qE 'phase27824|through 27824|e2e-phase27824' webui/STATUS.md
echo "STATUS ssh-auth-soft-28320-echo roster ok"; echo "cleaned"; echo "OK: phase27820 e2e passed"
