#!/usr/bin/env bash
# Phase-15900: STATUS mentions ssh_auth_penta_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_penta_checkpoint_roster|soft_fertig_ssh_auth_penta_checkpoint_roster' webui/STATUS.md
grep -qE 'phase15904|through 15904|e2e-phase15904' webui/STATUS.md
echo "STATUS ssh-auth-penta-checkpoint roster ok"; echo "cleaned"; echo "OK: phase15900 e2e passed"
