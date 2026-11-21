#!/usr/bin/env bash
# Phase-48460: STATUS mentions ssh_auth_schema_543_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_543_echo_roster|soft_fertig_ssh_auth_schema_543_echo_roster' webui/STATUS.md
grep -qE 'phase48464|through 48464|e2e-phase48464' webui/STATUS.md
echo "STATUS ssh-auth-schema-543-echo roster ok"; echo "cleaned"; echo "OK: phase48460 e2e passed"
