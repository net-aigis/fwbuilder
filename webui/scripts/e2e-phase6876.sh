#!/usr/bin/env bash
# Phase-6876: STATUS mentions ssh_refusal_status_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_status_refresh_roster.*(export|bundle)|Export.*ssh_refusal_status_refresh_roster' webui/STATUS.md
grep -qE 'phase6880|through 6880|e2e-phase6880' webui/STATUS.md
echo "STATUS ssh_refusal_status_refresh_roster export ok"; echo "cleaned"; echo "OK: phase6876 e2e passed"
