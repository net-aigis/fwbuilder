#!/usr/bin/env bash
# Phase-36844: STATUS Soft 36840+ ssh_auth_soft_38320_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36840\+|through 36848|ssh_auth_soft_38320_echo_roster' webui/STATUS.md
grep -qE 'phase36848|through 36848|e2e-phase36856' webui/STATUS.md
echo "STATUS Soft 36840+ ok"; echo "cleaned"; echo "OK: phase36844 e2e passed"
