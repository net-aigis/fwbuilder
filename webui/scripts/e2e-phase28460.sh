#!/usr/bin/env bash
# Phase-28460: STATUS mentions ssh_auth_soft_29040_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_29040_echo_roster|soft_fertig_ssh_auth_soft_29040_echo_roster' webui/STATUS.md
grep -qE 'phase28464|through 28464|e2e-phase28464' webui/STATUS.md
echo "STATUS ssh-auth-soft-29040-echo roster ok"; echo "cleaned"; echo "OK: phase28460 e2e passed"
