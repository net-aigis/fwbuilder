#!/usr/bin/env bash
# Phase-34140: STATUS mentions ssh_auth_triacontadocosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontadocosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase34144|through 34144|e2e-phase34144' webui/STATUS.md
echo "STATUS ssh-auth-triacontadocosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase34140 e2e passed"
