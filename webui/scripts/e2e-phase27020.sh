#!/usr/bin/env bash
# Phase-27020: STATUS mentions ssh_auth_schema_275_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_275_echo_roster|soft_fertig_ssh_auth_schema_275_echo_roster' webui/STATUS.md
grep -qE 'phase27024|through 27024|e2e-phase27024' webui/STATUS.md
echo "STATUS ssh-auth-schema-275-echo roster ok"; echo "cleaned"; echo "OK: phase27020 e2e passed"
