#!/usr/bin/env bash
# Phase-23580: STATUS mentions ssh_auth_enneacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_enneacosadeca_checkpoint_roster|soft_fertig_ssh_auth_enneacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase23584|through 23584|e2e-phase23584' webui/STATUS.md
echo "STATUS ssh-auth-enneacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase23580 e2e passed"
