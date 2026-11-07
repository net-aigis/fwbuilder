#!/usr/bin/env bash
# Phase-4636: STATUS mentions password_ssh_roster export / 4633-4640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'password_ssh_roster.*(export|bundle)|Export.*password_ssh_roster' webui/STATUS.md
grep -qE 'phase4640|through 4640|e2e-phase4640' webui/STATUS.md
echo "STATUS password_ssh_roster export ok"
echo "cleaned"
echo "OK: phase4636 e2e passed"
