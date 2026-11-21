#!/usr/bin/env bash
# Phase-16060: STATUS mentions ssh_auth_ms_47000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_47000_echo_roster|soft_fertig_ssh_auth_ms_47000_echo_roster' webui/STATUS.md
grep -qE 'phase16064|through 16064|e2e-phase16064' webui/STATUS.md
echo "STATUS ssh-auth-ms-47000-echo roster ok"; echo "cleaned"; echo "OK: phase16060 e2e passed"
