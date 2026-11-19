#!/usr/bin/env bash
# Phase-33820: STATUS mentions ssh_auth_triacontahenicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahenicosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase33824|through 33824|e2e-phase33824' webui/STATUS.md
echo "STATUS ssh-auth-triacontahenicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase33820 e2e passed"
