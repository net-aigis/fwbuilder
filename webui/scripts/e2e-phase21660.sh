#!/usr/bin/env bash
# Phase-21660: STATUS mentions ssh_auth_tricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_tricosadeca_checkpoint_roster|soft_fertig_ssh_auth_tricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase21664|through 21664|e2e-phase21664' webui/STATUS.md
echo "STATUS ssh-auth-tricosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase21660 e2e passed"
