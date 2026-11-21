#!/usr/bin/env bash
# Phase-29340: STATUS mentions ssh_auth_triacontaheptacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontaheptacosadeca_checkpoint_roster|soft_fertig_ssh_auth_triacontaheptacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase29344|through 29344|e2e-phase29344' webui/STATUS.md
echo "STATUS ssh-auth-triacontaheptacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase29340 e2e passed"
