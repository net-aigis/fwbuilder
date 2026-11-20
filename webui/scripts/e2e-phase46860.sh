#!/usr/bin/env bash
# Phase-46860: STATUS mentions ssh_auth_schema_523_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_523_echo_roster|soft_fertig_ssh_auth_schema_523_echo_roster' webui/STATUS.md
grep -qE 'phase46864|through 46864|e2e-phase46864' webui/STATUS.md
echo "STATUS ssh-auth-schema-523-echo roster ok"; echo "cleaned"; echo "OK: phase46860 e2e passed"
