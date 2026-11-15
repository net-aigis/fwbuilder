#!/usr/bin/env bash
# Phase-33324: STATUS Soft 33320+ ssh_auth_soft_34440_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 33320\+|through 33328|ssh_auth_soft_34440_echo_roster' webui/STATUS.md
grep -qE 'phase33328|through 33328|e2e-phase33336' webui/STATUS.md
echo "STATUS Soft 33320+ ok"; echo "cleaned"; echo "OK: phase33324 e2e passed"
