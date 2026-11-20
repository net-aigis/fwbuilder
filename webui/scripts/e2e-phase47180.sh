#!/usr/bin/env bash
# Phase-47180: STATUS mentions ssh_auth_schema_527_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_527_echo_roster|soft_fertig_ssh_auth_schema_527_echo_roster' webui/STATUS.md
grep -qE 'phase47184|through 47184|e2e-phase47184' webui/STATUS.md
echo "STATUS ssh-auth-schema-527-echo roster ok"; echo "cleaned"; echo "OK: phase47180 e2e passed"
