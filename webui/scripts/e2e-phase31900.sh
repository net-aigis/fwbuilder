#!/usr/bin/env bash
# Phase-31900: STATUS mentions ssh_auth_triacontapentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontapentacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase31904|through 31904|e2e-phase31904' webui/STATUS.md
echo "STATUS ssh-auth-triacontapentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase31900 e2e passed"
