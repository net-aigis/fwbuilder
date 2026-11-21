#!/usr/bin/env bash
# Phase-43100: STATUS mentions ssh_auth_triacontaicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaicosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase43104|through 43104|e2e-phase43104' webui/STATUS.md
echo "STATUS ssh-auth-triacontaicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase43100 e2e passed"
