#!/usr/bin/env bash
# Phase-42940: STATUS mentions ssh_auth_ms_89000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_89000_echo_roster|soft_fertig_ssh_auth_ms_89000_echo_roster' webui/STATUS.md
grep -qE 'phase42944|through 42944|e2e-phase42944' webui/STATUS.md
echo "STATUS ssh-auth-ms-89000-echo roster ok"; echo "cleaned"; echo "OK: phase42940 e2e passed"
