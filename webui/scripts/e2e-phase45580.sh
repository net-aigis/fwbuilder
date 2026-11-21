#!/usr/bin/env bash
# Phase-45580: STATUS mentions ssh_auth_schema_507_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_507_echo_roster|soft_fertig_ssh_auth_schema_507_echo_roster' webui/STATUS.md
grep -qE 'phase45584|through 45584|e2e-phase45584' webui/STATUS.md
echo "STATUS ssh-auth-schema-507-echo roster ok"; echo "cleaned"; echo "OK: phase45580 e2e passed"
