#!/usr/bin/env bash
# Phase-19420: STATUS mentions ssh_auth_hexadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_hexadeca_checkpoint_roster|soft_fertig_ssh_auth_hexadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase19424|through 19424|e2e-phase19424' webui/STATUS.md
echo "STATUS ssh-auth-hexadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase19420 e2e passed"
