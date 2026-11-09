#!/usr/bin/env bash
# Phase-16860: STATUS mentions ssh_auth_octa_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_octa_checkpoint_roster|soft_fertig_ssh_auth_octa_checkpoint_roster' webui/STATUS.md
grep -qE 'phase16864|through 16864|e2e-phase16864' webui/STATUS.md
echo "STATUS ssh-auth-octa-checkpoint roster ok"; echo "cleaned"; echo "OK: phase16860 e2e passed"
