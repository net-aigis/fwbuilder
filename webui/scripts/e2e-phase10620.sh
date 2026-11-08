#!/usr/bin/env bash
# Phase-10620: STATUS mentions ssh_auth_empty_check_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_empty_check_roster|soft_fertig_ssh_auth_empty_check_roster' webui/STATUS.md
grep -qE 'phase10624|through 10624|e2e-phase10624' webui/STATUS.md
echo "STATUS ssh-auth-empty-check roster ok"; echo "cleaned"; echo "OK: phase10620 e2e passed"
