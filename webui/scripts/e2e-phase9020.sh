#!/usr/bin/env bash
# Phase-9020: STATUS mentions ssh_auth_field_presence_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_field_presence_roster|soft_fertig_ssh_auth_field_presence_roster' webui/STATUS.md
grep -qE 'phase9024|through 9024|e2e-phase9024' webui/STATUS.md
echo "STATUS ssh-auth-field-presence roster ok"; echo "cleaned"; echo "OK: phase9020 e2e passed"
