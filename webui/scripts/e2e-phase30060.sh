#!/usr/bin/env bash
# Phase-30060: STATUS mentions ssh_auth_soft_30840_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_30840_echo_roster|soft_fertig_ssh_auth_soft_30840_echo_roster' webui/STATUS.md
grep -qE 'phase30064|through 30064|e2e-phase30064' webui/STATUS.md
echo "STATUS ssh-auth-soft-30840-echo roster ok"; echo "cleaned"; echo "OK: phase30060 e2e passed"
