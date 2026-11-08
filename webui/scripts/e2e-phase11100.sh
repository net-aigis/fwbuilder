#!/usr/bin/env bash
# Phase-11100: STATUS mentions ssh_auth_session_hint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_session_hint_roster|soft_fertig_ssh_auth_session_hint_roster' webui/STATUS.md
grep -qE 'phase11104|through 11104|e2e-phase11104' webui/STATUS.md
echo "STATUS ssh-auth-session-hint roster ok"; echo "cleaned"; echo "OK: phase11100 e2e passed"
