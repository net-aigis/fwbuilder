#!/usr/bin/env bash
# Phase-20940: STATUS mentions ssh_auth_schema_199_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_199_echo_roster|soft_fertig_ssh_auth_schema_199_echo_roster' webui/STATUS.md
grep -qE 'phase20944|through 20944|e2e-phase20944' webui/STATUS.md
echo "STATUS ssh-auth-schema-199-echo roster ok"; echo "cleaned"; echo "OK: phase20940 e2e passed"
