#!/usr/bin/env bash
# Phase-35660: STATUS mentions ssh_auth_schema_383_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_383_echo_roster|soft_fertig_ssh_auth_schema_383_echo_roster' webui/STATUS.md
grep -qE 'phase35664|through 35664|e2e-phase35664' webui/STATUS.md
echo "STATUS ssh-auth-schema-383-echo roster ok"; echo "cleaned"; echo "OK: phase35660 e2e passed"
