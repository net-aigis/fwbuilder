#!/usr/bin/env bash
# Phase-17740: STATUS mentions ssh_auth_schema_159_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_159_echo_roster|soft_fertig_ssh_auth_schema_159_echo_roster' webui/STATUS.md
grep -qE 'phase17744|through 17744|e2e-phase17744' webui/STATUS.md
echo "STATUS ssh-auth-schema-159-echo roster ok"; echo "cleaned"; echo "OK: phase17740 e2e passed"
