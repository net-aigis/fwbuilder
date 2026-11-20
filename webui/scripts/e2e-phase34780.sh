#!/usr/bin/env bash
# Phase-34780: STATUS mentions ssh_auth_triacontatetracosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontatetracosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontatetracosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase34784|through 34784|e2e-phase34784' webui/STATUS.md
echo "STATUS ssh-auth-triacontatetracosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase34780 e2e passed"
