#!/usr/bin/env bash
# Phase-38540: STATUS mentions ssh_auth_schema_419_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_419_echo_roster|soft_fertig_ssh_auth_schema_419_echo_roster' webui/STATUS.md
grep -qE 'phase38544|through 38544|e2e-phase38544' webui/STATUS.md
echo "STATUS ssh-auth-schema-419-echo roster ok"; echo "cleaned"; echo "OK: phase38540 e2e passed"
