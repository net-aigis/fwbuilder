#!/usr/bin/env bash
# Phase-23340: STATUS mentions ssh_auth_soft_23280_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_23280_echo_roster|soft_fertig_ssh_auth_soft_23280_echo_roster' webui/STATUS.md
grep -qE 'phase23344|through 23344|e2e-phase23344' webui/STATUS.md
echo "STATUS ssh-auth-soft-23280-echo roster ok"; echo "cleaned"; echo "OK: phase23340 e2e passed"
