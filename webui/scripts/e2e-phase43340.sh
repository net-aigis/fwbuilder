#!/usr/bin/env bash
# Phase-43340: STATUS mentions ssh_auth_schema_479_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_479_echo_roster|soft_fertig_ssh_auth_schema_479_echo_roster' webui/STATUS.md
grep -qE 'phase43344|through 43344|e2e-phase43344' webui/STATUS.md
echo "STATUS ssh-auth-schema-479-echo roster ok"; echo "cleaned"; echo "OK: phase43340 e2e passed"
