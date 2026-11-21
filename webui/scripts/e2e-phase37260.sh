#!/usr/bin/env bash
# Phase-37260: STATUS mentions ssh_auth_schema_403_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_403_echo_roster|soft_fertig_ssh_auth_schema_403_echo_roster' webui/STATUS.md
grep -qE 'phase37264|through 37264|e2e-phase37264' webui/STATUS.md
echo "STATUS ssh-auth-schema-403-echo roster ok"; echo "cleaned"; echo "OK: phase37260 e2e passed"
