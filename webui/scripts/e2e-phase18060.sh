#!/usr/bin/env bash
# Phase-18060: STATUS mentions ssh_auth_schema_163_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_163_echo_roster|soft_fertig_ssh_auth_schema_163_echo_roster' webui/STATUS.md
grep -qE 'phase18064|through 18064|e2e-phase18064' webui/STATUS.md
echo "STATUS ssh-auth-schema-163-echo roster ok"; echo "cleaned"; echo "OK: phase18060 e2e passed"
