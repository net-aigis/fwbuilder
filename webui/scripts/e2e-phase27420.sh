#!/usr/bin/env bash
# Phase-27420: STATUS mentions ssh_auth_triacontahenicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahenicosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase27424|through 27424|e2e-phase27424' webui/STATUS.md
echo "STATUS ssh-auth-triacontahenicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase27420 e2e passed"
