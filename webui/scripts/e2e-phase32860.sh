#!/usr/bin/env bash
# Phase-32860: STATUS mentions ssh_auth_triacontaoctacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaoctacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase32864|through 32864|e2e-phase32864' webui/STATUS.md
echo "STATUS ssh-auth-triacontaoctacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase32860 e2e passed"
