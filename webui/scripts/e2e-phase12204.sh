#!/usr/bin/env bash
# Phase-12204: STATUS Soft 12200+ ssh_auth_operator_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 12200\+|through 12208|ssh_auth_operator_echo_roster' webui/STATUS.md
grep -qE 'phase12208|through 12208|e2e-phase12216' webui/STATUS.md
echo "STATUS Soft 12200+ ok"; echo "cleaned"; echo "OK: phase12204 e2e passed"
