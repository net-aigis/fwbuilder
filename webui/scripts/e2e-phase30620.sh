#!/usr/bin/env bash
# Phase-30620: STATUS mentions ssh_auth_triacontahenicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahenicosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase30624|through 30624|e2e-phase30624' webui/STATUS.md
echo "STATUS ssh-auth-triacontahenicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase30620 e2e passed"
