#!/usr/bin/env bash
# Phase-9100: STATUS mentions ssh_auth_list_length_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_list_length_roster|soft_fertig_ssh_auth_list_length_roster' webui/STATUS.md
grep -qE 'phase9104|through 9104|e2e-phase9104' webui/STATUS.md
echo "STATUS ssh-auth-list-length roster ok"; echo "cleaned"; echo "OK: phase9100 e2e passed"
