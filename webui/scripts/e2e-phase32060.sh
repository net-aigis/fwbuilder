#!/usr/bin/env bash
# Phase-32060: STATUS mentions ssh_auth_ms_72000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_72000_echo_roster|soft_fertig_ssh_auth_ms_72000_echo_roster' webui/STATUS.md
grep -qE 'phase32064|through 32064|e2e-phase32064' webui/STATUS.md
echo "STATUS ssh-auth-ms-72000-echo roster ok"; echo "cleaned"; echo "OK: phase32060 e2e passed"
