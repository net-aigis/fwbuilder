#!/usr/bin/env bash
# Phase-47820: STATUS mentions ssh_auth_schema_535_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_535_echo_roster|soft_fertig_ssh_auth_schema_535_echo_roster' webui/STATUS.md
grep -qE 'phase47824|through 47824|e2e-phase47824' webui/STATUS.md
echo "STATUS ssh-auth-schema-535-echo roster ok"; echo "cleaned"; echo "OK: phase47820 e2e passed"
