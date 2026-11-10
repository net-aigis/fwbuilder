#!/usr/bin/env bash
# Phase-27100: STATUS mentions ssh_auth_triacontaicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaicosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase27104|through 27104|e2e-phase27104' webui/STATUS.md
echo "STATUS ssh-auth-triacontaicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase27100 e2e passed"
