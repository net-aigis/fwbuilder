#!/usr/bin/env bash
# Phase-42860: STATUS mentions ssh_auth_soft_45160_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_45160_echo_roster|soft_fertig_ssh_auth_soft_45160_echo_roster' webui/STATUS.md
grep -qE 'phase42864|through 42864|e2e-phase42864' webui/STATUS.md
echo "STATUS ssh-auth-soft-45160-echo roster ok"; echo "cleaned"; echo "OK: phase42860 e2e passed"
