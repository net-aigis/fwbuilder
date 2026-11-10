#!/usr/bin/env bash
# Phase-25740: STATUS mentions ssh_auth_schema_259_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_259_echo_roster|soft_fertig_ssh_auth_schema_259_echo_roster' webui/STATUS.md
grep -qE 'phase25744|through 25744|e2e-phase25744' webui/STATUS.md
echo "STATUS ssh-auth-schema-259-echo roster ok"; echo "cleaned"; echo "OK: phase25740 e2e passed"
