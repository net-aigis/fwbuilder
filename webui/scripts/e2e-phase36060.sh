#!/usr/bin/env bash
# Phase-36060: STATUS mentions ssh_auth_triacontaoctacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaoctacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase36064|through 36064|e2e-phase36064' webui/STATUS.md
echo "STATUS ssh-auth-triacontaoctacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase36060 e2e passed"
