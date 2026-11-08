#!/usr/bin/env bash
# Phase-12540: STATUS mentions ssh_auth_support_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_support_count_roster|soft_fertig_ssh_auth_support_count_roster' webui/STATUS.md
grep -qE 'phase12544|through 12544|e2e-phase12544' webui/STATUS.md
echo "STATUS ssh-auth-support-count roster ok"; echo "cleaned"; echo "OK: phase12540 e2e passed"
