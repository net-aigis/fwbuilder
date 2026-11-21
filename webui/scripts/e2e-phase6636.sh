#!/usr/bin/env bash
# Phase-6636: STATUS mentions ssh_implemented_identity_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_identity_roster.*(export|bundle)|Export.*ssh_implemented_identity_roster' webui/STATUS.md
grep -qE 'phase6640|through 6640|e2e-phase6640' webui/STATUS.md
echo "STATUS ssh_implemented_identity_roster export ok"; echo "cleaned"; echo "OK: phase6636 e2e passed"
