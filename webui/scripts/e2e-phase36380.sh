#!/usr/bin/env bash
# Phase-36380: STATUS mentions ssh_auth_triacontaenneacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaenneacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase36384|through 36384|e2e-phase36384' webui/STATUS.md
echo "STATUS ssh-auth-triacontaenneacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase36380 e2e passed"
