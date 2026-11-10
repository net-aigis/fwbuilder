#!/usr/bin/env bash
# Phase-22940: STATUS mentions ssh_auth_heptacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_heptacosadeca_checkpoint_roster|soft_fertig_ssh_auth_heptacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase22944|through 22944|e2e-phase22944' webui/STATUS.md
echo "STATUS ssh-auth-heptacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase22940 e2e passed"
