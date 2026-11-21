#!/usr/bin/env bash
# Phase-4540: STATUS mentions ssh_auth_roster / 4537-4544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'ssh_auth_roster|soft_fertig_ssh_auth_roster' webui/STATUS.md
grep -qE 'phase4544|through 4544|e2e-phase4544' webui/STATUS.md
echo "STATUS ssh-auth roster ok"
echo "cleaned"
echo "OK: phase4540 e2e passed"
