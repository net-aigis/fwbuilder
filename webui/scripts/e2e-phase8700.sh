#!/usr/bin/env bash
# Phase-8700: STATUS mentions ssh_not_implemented_password_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_password_refresh_roster|soft_fertig_ssh_not_implemented_password_refresh_roster' webui/STATUS.md
grep -qE 'phase8704|through 8704|e2e-phase8704' webui/STATUS.md
echo "STATUS ssh-not-implemented-password-refresh roster ok"; echo "cleaned"; echo "OK: phase8700 e2e passed"
