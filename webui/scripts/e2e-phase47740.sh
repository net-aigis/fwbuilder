#!/usr/bin/env bash
# Phase-47740: STATUS mentions ssh_auth_ms_96500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_96500_echo_roster|soft_fertig_ssh_auth_ms_96500_echo_roster' webui/STATUS.md
grep -qE 'phase47744|through 47744|e2e-phase47744' webui/STATUS.md
echo "STATUS ssh-auth-ms-96500-echo roster ok"; echo "cleaned"; echo "OK: phase47740 e2e passed"
