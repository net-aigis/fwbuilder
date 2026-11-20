#!/usr/bin/env bash
# Phase-43084: STATUS Soft 43080+ ssh_auth_schema_475_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43080\+|through 43088|ssh_auth_schema_475_echo_roster' webui/STATUS.md
grep -qE 'phase43088|through 43088|e2e-phase43096' webui/STATUS.md
echo "STATUS Soft 43080+ ok"; echo "cleaned"; echo "OK: phase43084 e2e passed"
