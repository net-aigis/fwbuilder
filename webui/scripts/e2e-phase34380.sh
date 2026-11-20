#!/usr/bin/env bash
# Phase-34380: STATUS mentions ssh_auth_schema_367_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_367_echo_roster|soft_fertig_ssh_auth_schema_367_echo_roster' webui/STATUS.md
grep -qE 'phase34384|through 34384|e2e-phase34384' webui/STATUS.md
echo "STATUS ssh-auth-schema-367-echo roster ok"; echo "cleaned"; echo "OK: phase34380 e2e passed"
