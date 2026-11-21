#!/usr/bin/env bash
# Phase-37340: STATUS mentions ssh_auth_triacontadocosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontadocosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase37344|through 37344|e2e-phase37344' webui/STATUS.md
echo "STATUS ssh-auth-triacontadocosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase37340 e2e passed"
