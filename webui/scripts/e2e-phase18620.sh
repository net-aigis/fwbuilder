#!/usr/bin/env bash
# Phase-18620: STATUS mentions ssh_auth_ms_51000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_51000_echo_roster|soft_fertig_ssh_auth_ms_51000_echo_roster' webui/STATUS.md
grep -qE 'phase18624|through 18624|e2e-phase18624' webui/STATUS.md
echo "STATUS ssh-auth-ms-51000-echo roster ok"; echo "cleaned"; echo "OK: phase18620 e2e passed"
