#!/usr/bin/env bash
# Phase-12060: STATUS mentions ssh_auth_readiness_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_readiness_echo_roster|soft_fertig_ssh_auth_readiness_echo_roster' webui/STATUS.md
grep -qE 'phase12064|through 12064|e2e-phase12064' webui/STATUS.md
echo "STATUS ssh-auth-readiness-echo roster ok"; echo "cleaned"; echo "OK: phase12060 e2e passed"
