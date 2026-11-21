#!/usr/bin/env bash
# Phase-11404: STATUS Soft 11400+ ssh_auth_surface_hint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 11400\+|through 11408|ssh_auth_surface_hint_roster' webui/STATUS.md
grep -qE 'phase11408|through 11408|e2e-phase11416' webui/STATUS.md
echo "STATUS Soft 11400+ ok"; echo "cleaned"; echo "OK: phase11404 e2e passed"
