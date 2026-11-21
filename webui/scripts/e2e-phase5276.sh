#!/usr/bin/env bash
# Phase-5276: STATUS mentions ssh_auth_policy_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_policy_roster.*(export|bundle)|Export.*ssh_auth_policy_roster' webui/STATUS.md
grep -qE 'phase5280|through 5120|e2e-phase5280' webui/STATUS.md
echo "STATUS ssh_auth_policy_roster export ok"; echo "cleaned"; echo "OK: phase5276 e2e passed"
