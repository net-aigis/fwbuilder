#!/usr/bin/env bash
# Phase-6156: STATUS mentions ssh_alternative_presence_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_presence_roster.*(export|bundle)|Export.*ssh_alternative_presence_roster' webui/STATUS.md
grep -qE 'phase6160|through 6160|e2e-phase6160' webui/STATUS.md
echo "STATUS ssh_alternative_presence_roster export ok"; echo "cleaned"; echo "OK: phase6156 e2e passed"
