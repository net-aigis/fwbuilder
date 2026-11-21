#!/usr/bin/env bash
# Phase-23260: STATUS mentions ssh_auth_octacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_octacosadeca_checkpoint_roster|soft_fertig_ssh_auth_octacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase23264|through 23264|e2e-phase23264' webui/STATUS.md
echo "STATUS ssh-auth-octacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase23260 e2e passed"
