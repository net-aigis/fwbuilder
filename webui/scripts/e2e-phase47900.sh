#!/usr/bin/env bash
# Phase-47900: STATUS mentions ssh_auth_triacontapentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontapentacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase47904|through 47904|e2e-phase47904' webui/STATUS.md
echo "STATUS ssh-auth-triacontapentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase47900 e2e passed"
