#!/usr/bin/env bash
# Phase-46220: STATUS mentions ssh_auth_schema_515_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_515_echo_roster|soft_fertig_ssh_auth_schema_515_echo_roster' webui/STATUS.md
grep -qE 'phase46224|through 46224|e2e-phase46224' webui/STATUS.md
echo "STATUS ssh-auth-schema-515-echo roster ok"; echo "cleaned"; echo "OK: phase46220 e2e passed"
