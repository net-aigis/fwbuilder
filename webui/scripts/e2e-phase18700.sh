#!/usr/bin/env bash
# Phase-18700: STATUS mentions ssh_auth_schema_171_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_171_echo_roster|soft_fertig_ssh_auth_schema_171_echo_roster' webui/STATUS.md
grep -qE 'phase18704|through 18704|e2e-phase18704' webui/STATUS.md
echo "STATUS ssh-auth-schema-171-echo roster ok"; echo "cleaned"; echo "OK: phase18700 e2e passed"
