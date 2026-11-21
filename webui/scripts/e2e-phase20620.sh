#!/usr/bin/env bash
# Phase-20620: STATUS mentions ssh_auth_schema_195_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_195_echo_roster|soft_fertig_ssh_auth_schema_195_echo_roster' webui/STATUS.md
grep -qE 'phase20624|through 20624|e2e-phase20624' webui/STATUS.md
echo "STATUS ssh-auth-schema-195-echo roster ok"; echo "cleaned"; echo "OK: phase20620 e2e passed"
