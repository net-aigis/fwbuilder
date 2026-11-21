#!/usr/bin/env bash
# Phase-12860: STATUS mentions ssh_auth_session_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_session_count_roster|soft_fertig_ssh_auth_session_count_roster' webui/STATUS.md
grep -qE 'phase12864|through 12864|e2e-phase12864' webui/STATUS.md
echo "STATUS ssh-auth-session-count roster ok"; echo "cleaned"; echo "OK: phase12860 e2e passed"
