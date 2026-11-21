#!/usr/bin/env bash
# Phase-9980: STATUS mentions ssh_auth_capability_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_capability_count_roster|soft_fertig_ssh_auth_capability_count_roster' webui/STATUS.md
grep -qE 'phase9984|through 9984|e2e-phase9984' webui/STATUS.md
echo "STATUS ssh-auth-capability-count roster ok"; echo "cleaned"; echo "OK: phase9980 e2e passed"
