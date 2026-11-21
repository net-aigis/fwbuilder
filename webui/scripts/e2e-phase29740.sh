#!/usr/bin/env bash
# Phase-29740: STATUS mentions ssh_auth_soft_30480_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_30480_echo_roster|soft_fertig_ssh_auth_soft_30480_echo_roster' webui/STATUS.md
grep -qE 'phase29744|through 29744|e2e-phase29744' webui/STATUS.md
echo "STATUS ssh-auth-soft-30480-echo roster ok"; echo "cleaned"; echo "OK: phase29740 e2e passed"
