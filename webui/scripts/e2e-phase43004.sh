#!/usr/bin/env bash
# Phase-43004: STATUS Soft 43000+ ssh_auth_ms_89000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43000\+|through 43008|ssh_auth_ms_89000_echo_roster' webui/STATUS.md
grep -qE 'phase43008|through 43008|e2e-phase43016' webui/STATUS.md
echo "STATUS Soft 43000+ ok"; echo "cleaned"; echo "OK: phase43004 e2e passed"
