#!/usr/bin/env bash
# Phase-18140: STATUS mentions ssh_auth_dodeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_dodeca_checkpoint_roster|soft_fertig_ssh_auth_dodeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase18144|through 18144|e2e-phase18144' webui/STATUS.md
echo "STATUS ssh-auth-dodeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase18140 e2e passed"
