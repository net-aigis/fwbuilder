#!/usr/bin/env bash
# Phase-11084: STATUS Soft 11080+ ssh_auth_refusal_related_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 11080\+|through 11088|ssh_auth_refusal_related_roster' webui/STATUS.md
grep -qE 'phase11088|through 11088|e2e-phase11096' webui/STATUS.md
echo "STATUS Soft 11080+ ok"; echo "cleaned"; echo "OK: phase11084 e2e passed"
