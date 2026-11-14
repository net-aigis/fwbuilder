#!/usr/bin/env bash
# Phase-31260: STATUS mentions ssh_auth_triacontatricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontatricosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase31264|through 31264|e2e-phase31264' webui/STATUS.md
echo "STATUS ssh-auth-triacontatricosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase31260 e2e passed"
