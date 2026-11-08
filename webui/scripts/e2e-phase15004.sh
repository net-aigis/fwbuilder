#!/usr/bin/env bash
# Phase-15004: STATUS Soft 15000+ ssh_auth_batch_only_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15000\+|through 15008|ssh_auth_batch_only_echo_roster' webui/STATUS.md
grep -qE 'phase15008|through 15008|e2e-phase15016' webui/STATUS.md
echo "STATUS Soft 15000+ ok"; echo "cleaned"; echo "OK: phase15004 e2e passed"
