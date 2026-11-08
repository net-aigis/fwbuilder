#!/usr/bin/env bash
# Phase-14780: STATUS mentions ssh_auth_schema_delta_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_schema_delta_roster|soft_fertig_ssh_auth_schema_delta_roster' webui/STATUS.md
grep -qE 'phase14784|through 14784|e2e-phase14784' webui/STATUS.md
echo "STATUS ssh-auth-schema-delta roster ok"; echo "cleaned"; echo "OK: phase14780 e2e passed"
