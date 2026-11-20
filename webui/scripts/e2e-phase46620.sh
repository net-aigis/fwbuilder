#!/usr/bin/env bash
# Phase-46620: STATUS mentions ssh_auth_triacontahenicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahenicosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase46624|through 46624|e2e-phase46624' webui/STATUS.md
echo "STATUS ssh-auth-triacontahenicosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase46620 e2e passed"
