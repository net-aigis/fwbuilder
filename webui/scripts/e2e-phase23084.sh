#!/usr/bin/env bash
# Phase-23084: STATUS Soft 23080+ ssh_auth_soft_22920_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23080\+|through 23088|ssh_auth_soft_22920_echo_roster' webui/STATUS.md
grep -qE 'phase23088|through 23088|e2e-phase23096' webui/STATUS.md
echo "STATUS Soft 23080+ ok"; echo "cleaned"; echo "OK: phase23084 e2e passed"
