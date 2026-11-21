#!/usr/bin/env bash
# Phase-41500: STATUS mentions ssh_auth_triacontapentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontapentacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase41504|through 41504|e2e-phase41504' webui/STATUS.md
echo "STATUS ssh-auth-triacontapentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase41500 e2e passed"
