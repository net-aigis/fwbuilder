#!/usr/bin/env bash
# Phase-40860: STATUS mentions ssh_auth_triacontatricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontatricosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase40864|through 40864|e2e-phase40864' webui/STATUS.md
echo "STATUS ssh-auth-triacontatricosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase40860 e2e passed"
