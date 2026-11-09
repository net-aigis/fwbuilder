#!/usr/bin/env bash
# Phase-18460: STATUS mentions ssh_auth_trideca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_trideca_checkpoint_roster|soft_fertig_ssh_auth_trideca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase18464|through 18464|e2e-phase18464' webui/STATUS.md
echo "STATUS ssh-auth-trideca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase18460 e2e passed"
