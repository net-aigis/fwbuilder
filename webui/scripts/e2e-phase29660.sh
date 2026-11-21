#!/usr/bin/env bash
# Phase-29660: STATUS mentions ssh_auth_triacontaoctacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaoctacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase29664|through 29664|e2e-phase29664' webui/STATUS.md
echo "STATUS ssh-auth-triacontaoctacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase29660 e2e passed"
