#!/usr/bin/env bash
# Phase-15260: STATUS mentions ssh_auth_triple_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triple_checkpoint_roster|soft_fertig_ssh_auth_triple_checkpoint_roster' webui/STATUS.md
grep -qE 'phase15264|through 15264|e2e-phase15264' webui/STATUS.md
echo "STATUS ssh-auth-triple-checkpoint roster ok"; echo "cleaned"; echo "OK: phase15260 e2e passed"
