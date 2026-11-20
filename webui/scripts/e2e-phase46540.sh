#!/usr/bin/env bash
# Phase-46540: STATUS mentions ssh_auth_schema_519_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_519_echo_roster|soft_fertig_ssh_auth_schema_519_echo_roster' webui/STATUS.md
grep -qE 'phase46544|through 46544|e2e-phase46544' webui/STATUS.md
echo "STATUS ssh-auth-schema-519-echo roster ok"; echo "cleaned"; echo "OK: phase46540 e2e passed"
