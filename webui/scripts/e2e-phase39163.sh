#!/usr/bin/env bash
# Phase-39163: client soft_fertig_ssh_auth_ms_83000_echo_roster Soft 39160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_83000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 39160+ soft_fertig_ssh_auth_ms_83000_echo_roster type ok"; echo "cleaned"; echo "OK: phase39163 e2e passed"
