#!/usr/bin/env bash
# Phase-12220: STATUS mentions ssh_auth_policy_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_policy_echo_roster|soft_fertig_ssh_auth_policy_echo_roster' webui/STATUS.md
grep -qE 'phase12224|through 12224|e2e-phase12224' webui/STATUS.md
echo "STATUS ssh-auth-policy-echo roster ok"; echo "cleaned"; echo "OK: phase12220 e2e passed"
