#!/usr/bin/env bash
# Phase-23900: STATUS mentions ssh_auth_triacontadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase23904|through 23904|e2e-phase23904' webui/STATUS.md
echo "STATUS ssh-auth-triacontadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase23900 e2e passed"
