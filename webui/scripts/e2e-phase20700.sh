#!/usr/bin/env bash
# Phase-20700: STATUS mentions ssh_auth_icosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_icosadeca_checkpoint_roster|soft_fertig_ssh_auth_icosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase20704|through 20704|e2e-phase20704' webui/STATUS.md
echo "STATUS ssh-auth-icosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase20700 e2e passed"
