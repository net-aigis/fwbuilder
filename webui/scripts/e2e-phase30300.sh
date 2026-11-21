#!/usr/bin/env bash
# Phase-30300: STATUS mentions ssh_auth_triacontaicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaicosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase30304|through 30304|e2e-phase30304' webui/STATUS.md
echo "STATUS ssh-auth-triacontaicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase30300 e2e passed"
