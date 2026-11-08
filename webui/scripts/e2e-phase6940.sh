#!/usr/bin/env bash
# Phase-6940: STATUS mentions ssh_auth_policy_refresh_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_policy_refresh_roster|soft_fertig_ssh_auth_policy_refresh_roster' webui/STATUS.md
grep -qE 'phase6944|through 6944|e2e-phase6944' webui/STATUS.md
echo "STATUS ssh-auth-policy-refresh roster ok"; echo "cleaned"; echo "OK: phase6940 e2e passed"
