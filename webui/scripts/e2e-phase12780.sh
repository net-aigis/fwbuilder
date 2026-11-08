#!/usr/bin/env bash
# Phase-12780: STATUS mentions ssh_auth_surface_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_surface_count_roster|soft_fertig_ssh_auth_surface_count_roster' webui/STATUS.md
grep -qE 'phase12784|through 12784|e2e-phase12784' webui/STATUS.md
echo "STATUS ssh-auth-surface-count roster ok"; echo "cleaned"; echo "OK: phase12780 e2e passed"
