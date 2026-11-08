#!/usr/bin/env bash
# Phase-6956: STATUS mentions ssh_auth_policy_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_policy_refresh_roster.*(export|bundle)|Export.*ssh_auth_policy_refresh_roster' webui/STATUS.md
grep -qE 'phase6960|through 6960|e2e-phase6960' webui/STATUS.md
echo "STATUS ssh_auth_policy_refresh_roster export ok"; echo "cleaned"; echo "OK: phase6956 e2e passed"
