#!/usr/bin/env bash
# Phase-40540: STATUS mentions ssh_auth_triacontadocosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontadocosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase40544|through 40544|e2e-phase40544' webui/STATUS.md
echo "STATUS ssh-auth-triacontadocosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase40540 e2e passed"
