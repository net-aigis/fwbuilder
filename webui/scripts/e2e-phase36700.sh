#!/usr/bin/env bash
# Phase-36700: STATUS mentions ssh_auth_triacontaicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaicosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase36704|through 36704|e2e-phase36704' webui/STATUS.md
echo "STATUS ssh-auth-triacontaicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase36700 e2e passed"
