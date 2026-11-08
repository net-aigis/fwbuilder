#!/usr/bin/env bash
# Phase-6236: STATUS mentions ssh_implemented_batch_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_batch_roster.*(export|bundle)|Export.*ssh_implemented_batch_roster' webui/STATUS.md
grep -qE 'phase6240|through 6240|e2e-phase6240' webui/STATUS.md
echo "STATUS ssh_implemented_batch_roster export ok"; echo "cleaned"; echo "OK: phase6236 e2e passed"
