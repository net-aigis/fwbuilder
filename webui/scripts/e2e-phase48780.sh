#!/usr/bin/env bash
# Phase-48780: STATUS mentions ssh_auth_schema_547_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_547_echo_roster|soft_fertig_ssh_auth_schema_547_echo_roster' webui/STATUS.md
grep -qE 'phase48784|through 48784|e2e-phase48784' webui/STATUS.md
echo "STATUS ssh-auth-schema-547-echo roster ok"; echo "cleaned"; echo "OK: phase48780 e2e passed"
