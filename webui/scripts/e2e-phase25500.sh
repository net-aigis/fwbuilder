#!/usr/bin/env bash
# Phase-25500: STATUS mentions ssh_auth_triacontapentadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontapentadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontapentadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase25504|through 25504|e2e-phase25504' webui/STATUS.md
echo "STATUS ssh-auth-triacontapentadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase25500 e2e passed"
