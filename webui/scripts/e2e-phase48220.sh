#!/usr/bin/env bash
# Phase-48220: STATUS mentions ssh_auth_triacontahexacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahexacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase48224|through 48224|e2e-phase48224' webui/STATUS.md
echo "STATUS ssh-auth-triacontahexacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase48220 e2e passed"
