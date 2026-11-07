#!/usr/bin/env bash
# Phase-5116: STATUS mentions ssh_refusal_status_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_status_roster.*(export|bundle)|Export.*ssh_refusal_status_roster' webui/STATUS.md
grep -qE 'phase5120|through 5120|e2e-phase5120' webui/STATUS.md
echo "STATUS ssh_refusal_status_roster export ok"; echo "cleaned"; echo "OK: phase5116 e2e passed"
