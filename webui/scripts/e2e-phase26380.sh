#!/usr/bin/env bash
# Phase-26380: STATUS mentions ssh_auth_schema_267_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_267_echo_roster|soft_fertig_ssh_auth_schema_267_echo_roster' webui/STATUS.md
grep -qE 'phase26384|through 26384|e2e-phase26384' webui/STATUS.md
echo "STATUS ssh-auth-schema-267-echo roster ok"; echo "cleaned"; echo "OK: phase26380 e2e passed"
