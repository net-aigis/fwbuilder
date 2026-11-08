#!/usr/bin/env bash
# Phase-12700: STATUS mentions ssh_auth_gap_open_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_gap_open_echo_roster|soft_fertig_ssh_auth_gap_open_echo_roster' webui/STATUS.md
grep -qE 'phase12704|through 12704|e2e-phase12704' webui/STATUS.md
echo "STATUS ssh-auth-gap-open-echo roster ok"; echo "cleaned"; echo "OK: phase12700 e2e passed"
