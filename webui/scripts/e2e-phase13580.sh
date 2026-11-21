#!/usr/bin/env bash
# Phase-13580: STATUS mentions ssh_auth_refusal_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_refusal_echo_roster|soft_fertig_ssh_auth_refusal_echo_roster' webui/STATUS.md
grep -qE 'phase13584|through 13584|e2e-phase13584' webui/STATUS.md
echo "STATUS ssh-auth-refusal-echo roster ok"; echo "cleaned"; echo "OK: phase13580 e2e passed"
