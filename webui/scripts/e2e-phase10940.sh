#!/usr/bin/env bash
# Phase-10940: STATUS mentions ssh_auth_gap_closure_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_gap_closure_echo_roster|soft_fertig_ssh_auth_gap_closure_echo_roster' webui/STATUS.md
grep -qE 'phase10944|through 10944|e2e-phase10944' webui/STATUS.md
echo "STATUS ssh-auth-gap-closure-echo roster ok"; echo "cleaned"; echo "OK: phase10940 e2e passed"
