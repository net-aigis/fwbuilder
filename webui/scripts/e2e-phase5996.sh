#!/usr/bin/env bash
# Phase-5996: STATUS mentions ssh_implemented_check_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_check_roster.*(export|bundle)|Export.*ssh_implemented_check_roster' webui/STATUS.md
grep -qE 'phase6000|through 6320|e2e-phase6000' webui/STATUS.md
echo "STATUS ssh_implemented_check_roster export ok"; echo "cleaned"; echo "OK: phase5996 e2e passed"
