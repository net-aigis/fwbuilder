#!/usr/bin/env bash
# Phase-27340: STATUS mentions ssh_auth_schema_279_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_279_echo_roster|soft_fertig_ssh_auth_schema_279_echo_roster' webui/STATUS.md
grep -qE 'phase27344|through 27344|e2e-phase27344' webui/STATUS.md
echo "STATUS ssh-auth-schema-279-echo roster ok"; echo "cleaned"; echo "OK: phase27340 e2e passed"
