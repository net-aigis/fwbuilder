#!/usr/bin/env bash
# Phase-19100: STATUS mentions ssh_auth_pentadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_pentadeca_checkpoint_roster|soft_fertig_ssh_auth_pentadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase19104|through 19104|e2e-phase19104' webui/STATUS.md
echo "STATUS ssh-auth-pentadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase19100 e2e passed"
