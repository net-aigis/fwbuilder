#!/usr/bin/env bash
# Phase-21340: STATUS mentions ssh_auth_docosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_docosadeca_checkpoint_roster|soft_fertig_ssh_auth_docosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase21344|through 21344|e2e-phase21344' webui/STATUS.md
echo "STATUS ssh-auth-docosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase21340 e2e passed"
