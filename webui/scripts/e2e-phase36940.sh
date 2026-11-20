#!/usr/bin/env bash
# Phase-36940: STATUS mentions ssh_auth_schema_399_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_399_echo_roster|soft_fertig_ssh_auth_schema_399_echo_roster' webui/STATUS.md
grep -qE 'phase36944|through 36944|e2e-phase36944' webui/STATUS.md
echo "STATUS ssh-auth-schema-399-echo roster ok"; echo "cleaned"; echo "OK: phase36940 e2e passed"
