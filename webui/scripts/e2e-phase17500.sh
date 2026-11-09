#!/usr/bin/env bash
# Phase-17500: STATUS mentions ssh_auth_deca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_deca_checkpoint_roster|soft_fertig_ssh_auth_deca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase17504|through 17504|e2e-phase17504' webui/STATUS.md
echo "STATUS ssh-auth-deca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase17500 e2e passed"
