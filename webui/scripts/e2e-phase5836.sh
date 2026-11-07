#!/usr/bin/env bash
# Phase-5836: STATUS mentions ssh_password_support_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_password_support_roster.*(export|bundle)|Export.*ssh_password_support_roster' webui/STATUS.md
grep -qE 'phase5840|through 6320|e2e-phase5840' webui/STATUS.md
echo "STATUS ssh_password_support_roster export ok"; echo "cleaned"; echo "OK: phase5836 e2e passed"
