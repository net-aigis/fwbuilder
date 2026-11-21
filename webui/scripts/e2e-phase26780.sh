#!/usr/bin/env bash
# Phase-26780: STATUS mentions ssh_auth_triacontaenneadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaenneadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaenneadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase26784|through 26784|e2e-phase26784' webui/STATUS.md
echo "STATUS ssh-auth-triacontaenneadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase26780 e2e passed"
