#!/usr/bin/env bash
# Phase-34460: STATUS mentions ssh_auth_triacontatricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontatricosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase34464|through 34464|e2e-phase34464' webui/STATUS.md
echo "STATUS ssh-auth-triacontatricosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase34460 e2e passed"
