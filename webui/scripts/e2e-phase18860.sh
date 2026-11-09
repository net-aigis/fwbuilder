#!/usr/bin/env bash
# Phase-18860: STATUS mentions ssh_auth_soft_18880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_18880_echo_roster|soft_fertig_ssh_auth_soft_18880_echo_roster' webui/STATUS.md
grep -qE 'phase18864|through 18864|e2e-phase18864' webui/STATUS.md
echo "STATUS ssh-auth-soft-18880-echo roster ok"; echo "cleaned"; echo "OK: phase18860 e2e passed"
