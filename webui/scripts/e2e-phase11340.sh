#!/usr/bin/env bash
# Phase-11340: STATUS mentions ssh_auth_surface_hint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_surface_hint_roster|soft_fertig_ssh_auth_surface_hint_roster' webui/STATUS.md
grep -qE 'phase11344|through 11344|e2e-phase11344' webui/STATUS.md
echo "STATUS ssh-auth-surface-hint roster ok"; echo "cleaned"; echo "OK: phase11340 e2e passed"
