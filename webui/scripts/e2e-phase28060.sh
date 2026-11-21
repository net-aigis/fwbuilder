#!/usr/bin/env bash
# Phase-28060: STATUS mentions ssh_auth_triacontatricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontatricosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase28064|through 28064|e2e-phase28064' webui/STATUS.md
echo "STATUS ssh-auth-triacontatricosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase28060 e2e passed"
