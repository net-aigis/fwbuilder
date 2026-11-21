#!/usr/bin/env bash
# Phase-5916: STATUS mentions ssh_batch_mode_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_batch_mode_roster.*(export|bundle)|Export.*ssh_batch_mode_roster' webui/STATUS.md
grep -qE 'phase5920|through 6320|e2e-phase5920' webui/STATUS.md
echo "STATUS ssh_batch_mode_roster export ok"; echo "cleaned"; echo "OK: phase5916 e2e passed"
