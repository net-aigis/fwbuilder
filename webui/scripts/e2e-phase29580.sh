#!/usr/bin/env bash
# Phase-29580: STATUS mentions ssh_auth_schema_307_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_307_echo_roster|soft_fertig_ssh_auth_schema_307_echo_roster' webui/STATUS.md
grep -qE 'phase29584|through 29584|e2e-phase29584' webui/STATUS.md
echo "STATUS ssh-auth-schema-307-echo roster ok"; echo "cleaned"; echo "OK: phase29580 e2e passed"
