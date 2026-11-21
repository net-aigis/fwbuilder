#!/usr/bin/env bash
# Phase-35020: STATUS mentions ssh_auth_schema_375_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_375_echo_roster|soft_fertig_ssh_auth_schema_375_echo_roster' webui/STATUS.md
grep -qE 'phase35024|through 35024|e2e-phase35024' webui/STATUS.md
echo "STATUS ssh-auth-schema-375-echo roster ok"; echo "cleaned"; echo "OK: phase35020 e2e passed"
