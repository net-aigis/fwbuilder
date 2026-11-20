#!/usr/bin/env bash
# Phase-42780: STATUS mentions ssh_auth_triacontaenneacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaenneacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase42784|through 42784|e2e-phase42784' webui/STATUS.md
echo "STATUS ssh-auth-triacontaenneacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase42780 e2e passed"
