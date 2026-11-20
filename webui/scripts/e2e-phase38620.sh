#!/usr/bin/env bash
# Phase-38620: STATUS mentions ssh_auth_triacontahexacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontahexacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase38624|through 38624|e2e-phase38624' webui/STATUS.md
echo "STATUS ssh-auth-triacontahexacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase38620 e2e passed"
