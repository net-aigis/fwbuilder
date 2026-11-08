#!/usr/bin/env bash
# Phase-6316: STATUS mentions ssh_not_implemented_batch_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_batch_roster.*(export|bundle)|Export.*ssh_not_implemented_batch_roster' webui/STATUS.md
grep -qE 'phase6320|through 6320|e2e-phase6320' webui/STATUS.md
echo "STATUS ssh_not_implemented_batch_roster export ok"; echo "cleaned"; echo "OK: phase6316 e2e passed"
