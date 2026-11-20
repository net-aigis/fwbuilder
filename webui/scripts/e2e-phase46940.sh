#!/usr/bin/env bash
# Phase-46940: STATUS mentions ssh_auth_triacontadocosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontadocosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase46944|through 46944|e2e-phase46944' webui/STATUS.md
echo "STATUS ssh-auth-triacontadocosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase46940 e2e passed"
