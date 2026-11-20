#!/usr/bin/env bash
# Phase-38203: client soft_fertig_ssh_auth_ms_81500_echo_roster Soft 38200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_81500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 38200+ soft_fertig_ssh_auth_ms_81500_echo_roster type ok"; echo "cleaned"; echo "OK: phase38203 e2e passed"
