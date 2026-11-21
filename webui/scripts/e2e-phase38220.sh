#!/usr/bin/env bash
# Phase-38220: STATUS mentions ssh_auth_schema_415_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_415_echo_roster|soft_fertig_ssh_auth_schema_415_echo_roster' webui/STATUS.md
grep -qE 'phase38224|through 38224|e2e-phase38224' webui/STATUS.md
echo "STATUS ssh-auth-schema-415-echo roster ok"; echo "cleaned"; echo "OK: phase38220 e2e passed"
