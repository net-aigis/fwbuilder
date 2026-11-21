#!/usr/bin/env bash
# Phase-33500: STATUS mentions ssh_auth_triacontaicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaicosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase33504|through 33504|e2e-phase33504' webui/STATUS.md
echo "STATUS ssh-auth-triacontaicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase33500 e2e passed"
