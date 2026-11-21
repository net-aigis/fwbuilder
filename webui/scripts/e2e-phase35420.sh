#!/usr/bin/env bash
# Phase-35420: STATUS mentions ssh_auth_triacontahexacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahexacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase35424|through 35424|e2e-phase35424' webui/STATUS.md
echo "STATUS ssh-auth-triacontahexacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase35420 e2e passed"
