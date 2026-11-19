#!/usr/bin/env bash
# Phase-33900: STATUS mentions ssh_auth_soft_35080_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_35080_echo_roster|soft_fertig_ssh_auth_soft_35080_echo_roster' webui/STATUS.md
grep -qE 'phase33904|through 33904|e2e-phase33904' webui/STATUS.md
echo "STATUS ssh-auth-soft-35080-echo roster ok"; echo "cleaned"; echo "OK: phase33900 e2e passed"
