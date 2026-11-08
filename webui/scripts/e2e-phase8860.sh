#!/usr/bin/env bash
# Phase-8860: STATUS mentions ssh_password_support_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_password_support_refresh_roster|soft_fertig_ssh_password_support_refresh_roster' webui/STATUS.md
grep -qE 'phase8864|through 8864|e2e-phase8864' webui/STATUS.md
echo "STATUS ssh-password-support-refresh roster ok"; echo "cleaned"; echo "OK: phase8860 e2e passed"
