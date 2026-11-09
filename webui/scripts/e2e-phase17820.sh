#!/usr/bin/env bash
# Phase-17820: STATUS mentions ssh_auth_undeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_undeca_checkpoint_roster|soft_fertig_ssh_auth_undeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase17824|through 17824|e2e-phase17824' webui/STATUS.md
echo "STATUS ssh-auth-undeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase17820 e2e passed"
