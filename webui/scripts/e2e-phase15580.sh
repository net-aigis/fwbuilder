#!/usr/bin/env bash
# Phase-15580: STATUS mentions ssh_auth_quad_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_quad_checkpoint_roster|soft_fertig_ssh_auth_quad_checkpoint_roster' webui/STATUS.md
grep -qE 'phase15584|through 15584|e2e-phase15584' webui/STATUS.md
echo "STATUS ssh-auth-quad-checkpoint roster ok"; echo "cleaned"; echo "OK: phase15580 e2e passed"
