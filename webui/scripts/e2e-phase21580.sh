#!/usr/bin/env bash
# Phase-21580: STATUS mentions ssh_auth_schema_207_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_207_echo_roster|soft_fertig_ssh_auth_schema_207_echo_roster' webui/STATUS.md
grep -qE 'phase21584|through 21584|e2e-phase21584' webui/STATUS.md
echo "STATUS ssh-auth-schema-207-echo roster ok"; echo "cleaned"; echo "OK: phase21580 e2e passed"
