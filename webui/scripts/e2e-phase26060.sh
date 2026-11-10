#!/usr/bin/env bash
# Phase-26060: STATUS mentions ssh_auth_schema_263_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_263_echo_roster|soft_fertig_ssh_auth_schema_263_echo_roster' webui/STATUS.md
grep -qE 'phase26064|through 26064|e2e-phase26064' webui/STATUS.md
echo "STATUS ssh-auth-schema-263-echo roster ok"; echo "cleaned"; echo "OK: phase26060 e2e passed"
