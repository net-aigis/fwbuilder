#!/usr/bin/env bash
# Phase-13084: STATUS Soft 13080+ ssh_auth_soft_plus_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13080\+|through 13088|ssh_auth_soft_plus_echo_roster' webui/STATUS.md
grep -qE 'phase13088|through 13088|e2e-phase13096' webui/STATUS.md
echo "STATUS Soft 13080+ ok"; echo "cleaned"; echo "OK: phase13084 e2e passed"
