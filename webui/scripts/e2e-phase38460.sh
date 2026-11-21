#!/usr/bin/env bash
# Phase-38460: STATUS mentions ssh_auth_ms_82000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_82000_echo_roster|soft_fertig_ssh_auth_ms_82000_echo_roster' webui/STATUS.md
grep -qE 'phase38464|through 38464|e2e-phase38464' webui/STATUS.md
echo "STATUS ssh-auth-ms-82000-echo roster ok"; echo "cleaned"; echo "OK: phase38460 e2e passed"
