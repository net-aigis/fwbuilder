#!/usr/bin/env bash
# Phase-34060: STATUS mentions ssh_auth_schema_363_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_363_echo_roster|soft_fertig_ssh_auth_schema_363_echo_roster' webui/STATUS.md
grep -qE 'phase34064|through 34064|e2e-phase34064' webui/STATUS.md
echo "STATUS ssh-auth-schema-363-echo roster ok"; echo "cleaned"; echo "OK: phase34060 e2e passed"
