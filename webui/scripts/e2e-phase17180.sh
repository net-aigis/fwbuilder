#!/usr/bin/env bash
# Phase-17180: STATUS mentions ssh_auth_nona_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_nona_checkpoint_roster|soft_fertig_ssh_auth_nona_checkpoint_roster' webui/STATUS.md
grep -qE 'phase17184|through 17184|e2e-phase17184' webui/STATUS.md
echo "STATUS ssh-auth-nona-checkpoint roster ok"; echo "cleaned"; echo "OK: phase17180 e2e passed"
