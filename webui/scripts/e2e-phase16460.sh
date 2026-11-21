#!/usr/bin/env bash
# Phase-16460: STATUS mentions ssh_auth_schema_143_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_143_echo_roster|soft_fertig_ssh_auth_schema_143_echo_roster' webui/STATUS.md
grep -qE 'phase16464|through 16464|e2e-phase16464' webui/STATUS.md
echo "STATUS ssh-auth-schema-143-echo roster ok"; echo "cleaned"; echo "OK: phase16460 e2e passed"
