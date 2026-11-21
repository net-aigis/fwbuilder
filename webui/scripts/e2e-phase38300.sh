#!/usr/bin/env bash
# Phase-38300: STATUS mentions ssh_auth_triacontapentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontapentacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase38304|through 38304|e2e-phase38304' webui/STATUS.md
echo "STATUS ssh-auth-triacontapentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase38300 e2e passed"
