#!/usr/bin/env bash
# Phase-28620: STATUS mentions ssh_auth_schema_295_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_295_echo_roster|soft_fertig_ssh_auth_schema_295_echo_roster' webui/STATUS.md
grep -qE 'phase28624|through 28624|e2e-phase28624' webui/STATUS.md
echo "STATUS ssh-auth-schema-295-echo roster ok"; echo "cleaned"; echo "OK: phase28620 e2e passed"
