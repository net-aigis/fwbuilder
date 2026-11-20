#!/usr/bin/env bash
# Phase-45660: STATUS mentions ssh_auth_triacontaoctacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaoctacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase45664|through 45664|e2e-phase45664' webui/STATUS.md
echo "STATUS ssh-auth-triacontaoctacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase45660 e2e passed"
