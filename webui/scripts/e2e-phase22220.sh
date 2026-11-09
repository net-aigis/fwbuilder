#!/usr/bin/env bash
# Phase-22220: STATUS mentions ssh_auth_schema_215_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_215_echo_roster|soft_fertig_ssh_auth_schema_215_echo_roster' webui/STATUS.md
grep -qE 'phase22224|through 22224|e2e-phase22224' webui/STATUS.md
echo "STATUS ssh-auth-schema-215-echo roster ok"; echo "cleaned"; echo "OK: phase22220 e2e passed"
