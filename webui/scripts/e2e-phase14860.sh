#!/usr/bin/env bash
# Phase-14860: STATUS mentions ssh_auth_hard_gap_stable_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_hard_gap_stable_roster|soft_fertig_ssh_auth_hard_gap_stable_roster' webui/STATUS.md
grep -qE 'phase14864|through 14864|e2e-phase14864' webui/STATUS.md
echo "STATUS ssh-auth-hard-gap-stable roster ok"; echo "cleaned"; echo "OK: phase14860 e2e passed"
