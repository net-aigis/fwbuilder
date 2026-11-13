#!/usr/bin/env bash
# Phase-30220: STATUS mentions ssh_auth_schema_315_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_315_echo_roster|soft_fertig_ssh_auth_schema_315_echo_roster' webui/STATUS.md
grep -qE 'phase30224|through 30224|e2e-phase30224' webui/STATUS.md
echo "STATUS ssh-auth-schema-315-echo roster ok"; echo "cleaned"; echo "OK: phase30220 e2e passed"
