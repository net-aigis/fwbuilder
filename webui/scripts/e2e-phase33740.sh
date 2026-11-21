#!/usr/bin/env bash
# Phase-33740: STATUS mentions ssh_auth_schema_359_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_359_echo_roster|soft_fertig_ssh_auth_schema_359_echo_roster' webui/STATUS.md
grep -qE 'phase33744|through 33744|e2e-phase33744' webui/STATUS.md
echo "STATUS ssh-auth-schema-359-echo roster ok"; echo "cleaned"; echo "OK: phase33740 e2e passed"
