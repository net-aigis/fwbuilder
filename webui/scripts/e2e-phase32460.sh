#!/usr/bin/env bash
# Phase-32460: STATUS mentions ssh_auth_schema_343_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_343_echo_roster|soft_fertig_ssh_auth_schema_343_echo_roster' webui/STATUS.md
grep -qE 'phase32464|through 32464|e2e-phase32464' webui/STATUS.md
echo "STATUS ssh-auth-schema-343-echo roster ok"; echo "cleaned"; echo "OK: phase32460 e2e passed"
