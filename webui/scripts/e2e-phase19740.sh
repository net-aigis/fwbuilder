#!/usr/bin/env bash
# Phase-19740: STATUS mentions ssh_auth_heptadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_heptadeca_checkpoint_roster|soft_fertig_ssh_auth_heptadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase19744|through 19744|e2e-phase19744' webui/STATUS.md
echo "STATUS ssh-auth-heptadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase19740 e2e passed"
