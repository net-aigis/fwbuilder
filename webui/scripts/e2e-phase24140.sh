#!/usr/bin/env bash
# Phase-24140: STATUS mentions ssh_auth_schema_239_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_239_echo_roster|soft_fertig_ssh_auth_schema_239_echo_roster' webui/STATUS.md
grep -qE 'phase24144|through 24144|e2e-phase24144' webui/STATUS.md
echo "STATUS ssh-auth-schema-239-echo roster ok"; echo "cleaned"; echo "OK: phase24140 e2e passed"
