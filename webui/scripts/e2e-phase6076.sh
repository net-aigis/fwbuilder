#!/usr/bin/env bash
# Phase-6076: STATUS mentions ssh_not_implemented_check_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_check_roster.*(export|bundle)|Export.*ssh_not_implemented_check_roster' webui/STATUS.md
grep -qE 'phase6080|through 6080|e2e-phase6080' webui/STATUS.md
echo "STATUS ssh_not_implemented_check_roster export ok"; echo "cleaned"; echo "OK: phase6076 e2e passed"
