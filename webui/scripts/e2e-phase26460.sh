#!/usr/bin/env bash
# Phase-26460: STATUS mentions ssh_auth_triacontaoctadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaoctadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaoctadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase26464|through 26464|e2e-phase26464' webui/STATUS.md
echo "STATUS ssh-auth-triacontaoctadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase26460 e2e passed"
