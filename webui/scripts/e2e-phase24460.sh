#!/usr/bin/env bash
# Phase-24460: STATUS mentions ssh_auth_schema_243_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_243_echo_roster|soft_fertig_ssh_auth_schema_243_echo_roster' webui/STATUS.md
grep -qE 'phase24464|through 24464|e2e-phase24464' webui/STATUS.md
echo "STATUS ssh-auth-schema-243-echo roster ok"; echo "cleaned"; echo "OK: phase24460 e2e passed"
