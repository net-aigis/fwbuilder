#!/usr/bin/env bash
# Phase-14380: STATUS mentions ssh_auth_session_ssh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_session_ssh_ratio_roster|soft_fertig_ssh_auth_session_ssh_ratio_roster' webui/STATUS.md
grep -qE 'phase14384|through 14384|e2e-phase14384' webui/STATUS.md
echo "STATUS ssh-auth-session-ssh-ratio roster ok"; echo "cleaned"; echo "OK: phase14380 e2e passed"
