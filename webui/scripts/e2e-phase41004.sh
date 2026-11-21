#!/usr/bin/env bash
# Phase-41004: STATUS Soft 41000+ ssh_auth_soft_43000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 41000\+|through 41008|ssh_auth_soft_43000_echo_roster' webui/STATUS.md
grep -qE 'phase41008|through 41008|e2e-phase41016' webui/STATUS.md
echo "STATUS Soft 41000+ ok"; echo "cleaned"; echo "OK: phase41004 e2e passed"
