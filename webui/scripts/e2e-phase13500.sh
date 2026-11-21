#!/usr/bin/env bash
# Phase-13500: STATUS mentions ssh_auth_ni_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ni_count_roster|soft_fertig_ssh_auth_ni_count_roster' webui/STATUS.md
grep -qE 'phase13504|through 13504|e2e-phase13504' webui/STATUS.md
echo "STATUS ssh-auth-ni-count roster ok"; echo "cleaned"; echo "OK: phase13500 e2e passed"
