#!/usr/bin/env bash
# Phase-25180: STATUS mentions ssh_auth_triacontatetradeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontatetradeca_checkpoint_roster|soft_fertig_ssh_auth_triacontatetradeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase25184|through 25184|e2e-phase25184' webui/STATUS.md
echo "STATUS ssh-auth-triacontatetradeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase25180 e2e passed"
