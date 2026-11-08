#!/usr/bin/env bash
# Phase-7116: STATUS mentions ssh_alternatives_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternatives_refresh_roster.*(export|bundle)|Export.*ssh_alternatives_refresh_roster' webui/STATUS.md
grep -qE 'phase7120|through 7120|e2e-phase7120' webui/STATUS.md
echo "STATUS ssh_alternatives_refresh_roster export ok"; echo "cleaned"; echo "OK: phase7116 e2e passed"
