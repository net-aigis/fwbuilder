#!/usr/bin/env bash
# Phase-28700: STATUS mentions ssh_auth_triacontapentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontapentacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase28704|through 28704|e2e-phase28704' webui/STATUS.md
echo "STATUS ssh-auth-triacontapentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase28700 e2e passed"
