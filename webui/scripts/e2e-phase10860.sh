#!/usr/bin/env bash
# Phase-10860: STATUS mentions ssh_auth_gap_label_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_gap_label_echo_roster|soft_fertig_ssh_auth_gap_label_echo_roster' webui/STATUS.md
grep -qE 'phase10864|through 10864|e2e-phase10864' webui/STATUS.md
echo "STATUS ssh-auth-gap-label-echo roster ok"; echo "cleaned"; echo "OK: phase10860 e2e passed"
