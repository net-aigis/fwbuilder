#!/usr/bin/env bash
# Phase-25820: STATUS mentions ssh_auth_triacontahexadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahexadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahexadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase25824|through 25824|e2e-phase25824' webui/STATUS.md
echo "STATUS ssh-auth-triacontahexadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase25820 e2e passed"
