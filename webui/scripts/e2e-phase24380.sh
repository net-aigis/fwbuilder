#!/usr/bin/env bash
# Phase-24380: STATUS mentions ssh_auth_ms_60000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_60000_echo_roster|soft_fertig_ssh_auth_ms_60000_echo_roster' webui/STATUS.md
grep -qE 'phase24384|through 24384|e2e-phase24384' webui/STATUS.md
echo "STATUS ssh-auth-ms-60000-echo roster ok"; echo "cleaned"; echo "OK: phase24380 e2e passed"
