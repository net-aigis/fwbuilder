#!/usr/bin/env bash
# Phase-20060: STATUS mentions ssh_auth_octadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_octadeca_checkpoint_roster|soft_fertig_ssh_auth_octadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase20064|through 20064|e2e-phase20064' webui/STATUS.md
echo "STATUS ssh-auth-octadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase20060 e2e passed"
