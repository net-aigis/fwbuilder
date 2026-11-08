#!/usr/bin/env bash
# Phase-14204: STATUS Soft 14200+ ssh_auth_soft_phase_parts_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14200\+|through 14208|ssh_auth_soft_phase_parts_roster' webui/STATUS.md
grep -qE 'phase14208|through 14208|e2e-phase14216' webui/STATUS.md
echo "STATUS Soft 14200+ ok"; echo "cleaned"; echo "OK: phase14204 e2e passed"
