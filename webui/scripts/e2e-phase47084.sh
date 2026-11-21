#!/usr/bin/env bash
# Phase-47084: STATUS Soft 47080+ ssh_auth_soft_49840_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 47080\+|through 47088|ssh_auth_soft_49840_echo_roster' webui/STATUS.md
grep -qE 'phase47088|through 47088|e2e-phase47096' webui/STATUS.md
echo "STATUS Soft 47080+ ok"; echo "cleaned"; echo "OK: phase47084 e2e passed"
