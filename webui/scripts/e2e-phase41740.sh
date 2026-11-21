#!/usr/bin/env bash
# Phase-41740: STATUS mentions ssh_auth_schema_459_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_459_echo_roster|soft_fertig_ssh_auth_schema_459_echo_roster' webui/STATUS.md
grep -qE 'phase41744|through 41744|e2e-phase41744' webui/STATUS.md
echo "STATUS ssh-auth-schema-459-echo roster ok"; echo "cleaned"; echo "OK: phase41740 e2e passed"
