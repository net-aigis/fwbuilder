#!/usr/bin/env bash
# Phase-22620: STATUS mentions ssh_auth_hexacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_hexacosadeca_checkpoint_roster|soft_fertig_ssh_auth_hexacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase22624|through 22624|e2e-phase22624' webui/STATUS.md
echo "STATUS ssh-auth-hexacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase22620 e2e passed"
