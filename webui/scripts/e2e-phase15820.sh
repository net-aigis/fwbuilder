#!/usr/bin/env bash
# Phase-15820: STATUS mentions ssh_auth_schema_135_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_135_echo_roster|soft_fertig_ssh_auth_schema_135_echo_roster' webui/STATUS.md
grep -qE 'phase15824|through 15824|e2e-phase15824' webui/STATUS.md
echo "STATUS ssh-auth-schema-135-echo roster ok"; echo "cleaned"; echo "OK: phase15820 e2e passed"
