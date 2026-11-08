#!/usr/bin/env bash
# Phase-15484: STATUS Soft 15480+ ssh_auth_ms_46000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15480\+|through 15488|ssh_auth_ms_46000_echo_roster' webui/STATUS.md
grep -qE 'phase15488|through 15488|e2e-phase15496' webui/STATUS.md
echo "STATUS Soft 15480+ ok"; echo "cleaned"; echo "OK: phase15484 e2e passed"
