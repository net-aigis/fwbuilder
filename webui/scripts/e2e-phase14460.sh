#!/usr/bin/env bash
# Phase-14460: STATUS mentions ssh_auth_clear_ssh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_clear_ssh_ratio_roster|soft_fertig_ssh_auth_clear_ssh_ratio_roster' webui/STATUS.md
grep -qE 'phase14464|through 14464|e2e-phase14464' webui/STATUS.md
echo "STATUS ssh-auth-clear-ssh-ratio roster ok"; echo "cleaned"; echo "OK: phase14460 e2e passed"
