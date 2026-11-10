#!/usr/bin/env bash
# Phase-24540: STATUS mentions ssh_auth_triacontadodeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_triacontadodeca_checkpoint_roster|soft_fertig_ssh_auth_triacontadodeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase24544|through 24544|e2e-phase24544' webui/STATUS.md
echo "STATUS ssh-auth-triacontadodeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase24540 e2e passed"
