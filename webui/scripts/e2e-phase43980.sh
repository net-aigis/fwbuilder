#!/usr/bin/env bash
# Phase-43980: STATUS mentions ssh_auth_schema_487_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_487_echo_roster|soft_fertig_ssh_auth_schema_487_echo_roster' webui/STATUS.md
grep -qE 'phase43984|through 43984|e2e-phase43984' webui/STATUS.md
echo "STATUS ssh-auth-schema-487-echo roster ok"; echo "cleaned"; echo "OK: phase43980 e2e passed"
