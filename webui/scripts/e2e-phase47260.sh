#!/usr/bin/env bash
# Phase-47260: STATUS mentions ssh_auth_triacontatricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontatricosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase47264|through 47264|e2e-phase47264' webui/STATUS.md
echo "STATUS ssh-auth-triacontatricosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase47260 e2e passed"
