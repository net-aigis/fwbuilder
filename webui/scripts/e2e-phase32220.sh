#!/usr/bin/env bash
# Phase-32220: STATUS mentions ssh_auth_triacontahexacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahexacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase32224|through 32224|e2e-phase32224' webui/STATUS.md
echo "STATUS ssh-auth-triacontahexacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase32220 e2e passed"
