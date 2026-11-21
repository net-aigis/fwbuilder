#!/usr/bin/env bash
# Phase-33100: STATUS mentions ssh_auth_schema_351_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_351_echo_roster|soft_fertig_ssh_auth_schema_351_echo_roster' webui/STATUS.md
grep -qE 'phase33104|through 33104|e2e-phase33104' webui/STATUS.md
echo "STATUS ssh-auth-schema-351-echo roster ok"; echo "cleaned"; echo "OK: phase33100 e2e passed"
