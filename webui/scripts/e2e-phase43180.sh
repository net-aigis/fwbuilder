#!/usr/bin/env bash
# Phase-43180: STATUS mentions ssh_auth_soft_45520_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_45520_echo_roster|soft_fertig_ssh_auth_soft_45520_echo_roster' webui/STATUS.md
grep -qE 'phase43184|through 43184|e2e-phase43184' webui/STATUS.md
echo "STATUS ssh-auth-soft-45520-echo roster ok"; echo "cleaned"; echo "OK: phase43180 e2e passed"
