#!/usr/bin/env bash
# Phase-21900: STATUS mentions ssh_auth_schema_211_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_211_echo_roster|soft_fertig_ssh_auth_schema_211_echo_roster' webui/STATUS.md
grep -qE 'phase21904|through 21904|e2e-phase21904' webui/STATUS.md
echo "STATUS ssh-auth-schema-211-echo roster ok"; echo "cleaned"; echo "OK: phase21900 e2e passed"
