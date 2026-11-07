#!/usr/bin/env bash
# Phase-4876: STATUS mentions ssh_capability_flags_roster export / 4873-4880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_capability_flags_roster.*(export|bundle)|Export.*ssh_capability_flags_roster' webui/STATUS.md
grep -qE 'phase4880|through 4880|e2e-phase4880' webui/STATUS.md
echo "STATUS ssh_capability_flags_roster export ok"; echo "cleaned"; echo "OK: phase4876 e2e passed"
