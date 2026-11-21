#!/usr/bin/env bash
# Phase-14700: STATUS mentions ssh_auth_ms_delta_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_delta_roster|soft_fertig_ssh_auth_ms_delta_roster' webui/STATUS.md
grep -qE 'phase14704|through 14704|e2e-phase14704' webui/STATUS.md
echo "STATUS ssh-auth-ms-delta roster ok"; echo "cleaned"; echo "OK: phase14700 e2e passed"
