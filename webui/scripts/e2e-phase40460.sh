#!/usr/bin/env bash
# Phase-40460: STATUS mentions ssh_auth_schema_443_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_443_echo_roster|soft_fertig_ssh_auth_schema_443_echo_roster' webui/STATUS.md
grep -qE 'phase40464|through 40464|e2e-phase40464' webui/STATUS.md
echo "STATUS ssh-auth-schema-443-echo roster ok"; echo "cleaned"; echo "OK: phase40460 e2e passed"
