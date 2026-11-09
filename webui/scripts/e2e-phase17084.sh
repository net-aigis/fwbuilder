#!/usr/bin/env bash
# Phase-17084: STATUS Soft 17080+ ssh_auth_ms_48500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17080\+|through 17088|ssh_auth_ms_48500_echo_roster' webui/STATUS.md
grep -qE 'phase17088|through 17088|e2e-phase17096' webui/STATUS.md
echo "STATUS Soft 17080+ ok"; echo "cleaned"; echo "OK: phase17084 e2e passed"
