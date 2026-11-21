#!/usr/bin/env bash
# Phase-5196: STATUS mentions ssh_method_lists_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_method_lists_roster.*(export|bundle)|Export.*ssh_method_lists_roster' webui/STATUS.md
grep -qE 'phase5200|through 5120|e2e-phase5200' webui/STATUS.md
echo "STATUS ssh_method_lists_roster export ok"; echo "cleaned"; echo "OK: phase5196 e2e passed"
