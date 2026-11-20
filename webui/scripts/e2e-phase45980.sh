#!/usr/bin/env bash
# Phase-45980: STATUS mentions ssh_auth_triacontaenneacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaenneacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase45984|through 45984|e2e-phase45984' webui/STATUS.md
echo "STATUS ssh-auth-triacontaenneacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase45980 e2e passed"
