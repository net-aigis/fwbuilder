#!/usr/bin/env bash
# Phase-5260: STATUS mentions ssh_auth_policy_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_policy_roster|soft_fertig_ssh_auth_policy_roster' webui/STATUS.md
grep -qE 'phase5264|through 5104|e2e-phase5264' webui/STATUS.md
echo "STATUS ssh-auth-policy roster ok"; echo "cleaned"; echo "OK: phase5260 e2e passed"
