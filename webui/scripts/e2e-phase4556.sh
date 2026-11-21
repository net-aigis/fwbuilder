#!/usr/bin/env bash
# Phase-4556: STATUS mentions ssh_auth_roster export / 4553-4560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'ssh_auth_roster.*(export|bundle)|Export.*ssh_auth_roster' webui/STATUS.md
grep -qE 'phase4560|through 4560|e2e-phase4560' webui/STATUS.md
echo "STATUS ssh_auth_roster export ok"
echo "cleaned"
echo "OK: phase4556 e2e passed"
