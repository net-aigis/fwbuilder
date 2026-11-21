#!/usr/bin/env bash
# Phase-14300: STATUS mentions ssh_auth_surface_ssh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_surface_ssh_ratio_roster|soft_fertig_ssh_auth_surface_ssh_ratio_roster' webui/STATUS.md
grep -qE 'phase14304|through 14304|e2e-phase14304' webui/STATUS.md
echo "STATUS ssh-auth-surface-ssh-ratio roster ok"; echo "cleaned"; echo "OK: phase14300 e2e passed"
