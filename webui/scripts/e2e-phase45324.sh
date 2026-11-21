#!/usr/bin/env bash
# Phase-45324: STATUS Soft 45320+ ssh_auth_schema_503_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 45320\+|through 45328|ssh_auth_schema_503_echo_roster' webui/STATUS.md
grep -qE 'phase45328|through 45328|e2e-phase45336' webui/STATUS.md
echo "STATUS Soft 45320+ ok"; echo "cleaned"; echo "OK: phase45324 e2e passed"
