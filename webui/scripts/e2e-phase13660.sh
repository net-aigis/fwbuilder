#!/usr/bin/env bash
# Phase-13660: STATUS mentions ssh_auth_cap_key_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_cap_key_count_roster|soft_fertig_ssh_auth_cap_key_count_roster' webui/STATUS.md
grep -qE 'phase13664|through 13664|e2e-phase13664' webui/STATUS.md
echo "STATUS ssh-auth-cap-key-count roster ok"; echo "cleaned"; echo "OK: phase13660 e2e passed"
