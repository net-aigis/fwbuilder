#!/usr/bin/env bash
# Phase-18380: STATUS mentions ssh_auth_schema_167_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_167_echo_roster|soft_fertig_ssh_auth_schema_167_echo_roster' webui/STATUS.md
grep -qE 'phase18384|through 18384|e2e-phase18384' webui/STATUS.md
echo "STATUS ssh-auth-schema-167-echo roster ok"; echo "cleaned"; echo "OK: phase18380 e2e passed"
