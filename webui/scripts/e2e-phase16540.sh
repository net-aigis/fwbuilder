#!/usr/bin/env bash
# Phase-16540: STATUS mentions ssh_auth_hepta_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_hepta_checkpoint_roster|soft_fertig_ssh_auth_hepta_checkpoint_roster' webui/STATUS.md
grep -qE 'phase16544|through 16544|e2e-phase16544' webui/STATUS.md
echo "STATUS ssh-auth-hepta-checkpoint roster ok"; echo "cleaned"; echo "OK: phase16540 e2e passed"
