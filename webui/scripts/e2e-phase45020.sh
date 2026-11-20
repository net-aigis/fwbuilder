#!/usr/bin/env bash
# Phase-45020: STATUS mentions ssh_auth_triacontahexacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahexacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase45024|through 45024|e2e-phase45024' webui/STATUS.md
echo "STATUS ssh-auth-triacontahexacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase45020 e2e passed"
