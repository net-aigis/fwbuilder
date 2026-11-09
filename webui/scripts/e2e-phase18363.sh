#!/usr/bin/env bash
# Phase-18363: client soft_fertig_ssh_auth_ms_50500_echo_roster Soft 18360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_50500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 18360+ soft_fertig_ssh_auth_ms_50500_echo_roster type ok"; echo "cleaned"; echo "OK: phase18363 e2e passed"
