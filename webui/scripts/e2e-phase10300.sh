#!/usr/bin/env bash
# Phase-10300: STATUS mentions ssh_auth_key_surface_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_key_surface_roster|soft_fertig_ssh_auth_key_surface_roster' webui/STATUS.md
grep -qE 'phase10304|through 10304|e2e-phase10304' webui/STATUS.md
echo "STATUS ssh-auth-key-surface roster ok"; echo "cleaned"; echo "OK: phase10300 e2e passed"
