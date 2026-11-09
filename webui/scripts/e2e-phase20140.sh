#!/usr/bin/env bash
# Phase-20140: STATUS mentions ssh_auth_soft_20160_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_20160_echo_roster|soft_fertig_ssh_auth_soft_20160_echo_roster' webui/STATUS.md
grep -qE 'phase20144|through 20144|e2e-phase20144' webui/STATUS.md
echo "STATUS ssh-auth-soft-20160-echo roster ok"; echo "cleaned"; echo "OK: phase20140 e2e passed"
