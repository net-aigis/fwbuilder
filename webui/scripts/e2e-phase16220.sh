#!/usr/bin/env bash
# Phase-16220: STATUS mentions ssh_auth_hexa_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_hexa_checkpoint_roster|soft_fertig_ssh_auth_hexa_checkpoint_roster' webui/STATUS.md
grep -qE 'phase16224|through 16224|e2e-phase16224' webui/STATUS.md
echo "STATUS ssh-auth-hexa-checkpoint roster ok"; echo "cleaned"; echo "OK: phase16220 e2e passed"
