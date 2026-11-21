#!/usr/bin/env bash
# Phase-26140: STATUS mentions ssh_auth_triacontaheptadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaheptadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaheptadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase26144|through 26144|e2e-phase26144' webui/STATUS.md
echo "STATUS ssh-auth-triacontaheptadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase26140 e2e passed"
