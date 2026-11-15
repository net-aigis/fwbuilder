#!/usr/bin/env bash
# Phase-32780: STATUS mentions ssh_auth_schema_347_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_347_echo_roster|soft_fertig_ssh_auth_schema_347_echo_roster' webui/STATUS.md
grep -qE 'phase32784|through 32784|e2e-phase32784' webui/STATUS.md
echo "STATUS ssh-auth-schema-347-echo roster ok"; echo "cleaned"; echo "OK: phase32780 e2e passed"
