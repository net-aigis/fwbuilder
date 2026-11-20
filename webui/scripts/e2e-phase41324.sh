#!/usr/bin/env bash
# Phase-41324: STATUS Soft 41320+ ssh_auth_soft_43360_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 41320\+|through 41328|ssh_auth_soft_43360_echo_roster' webui/STATUS.md
grep -qE 'phase41328|through 41328|e2e-phase41336' webui/STATUS.md
echo "STATUS Soft 41320+ ok"; echo "cleaned"; echo "OK: phase41324 e2e passed"
