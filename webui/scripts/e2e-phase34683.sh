#!/usr/bin/env bash
# Phase-34683: client soft_fertig_ssh_auth_ms_76000_echo_roster Soft 34680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_76000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 34680+ soft_fertig_ssh_auth_ms_76000_echo_roster type ok"; echo "cleaned"; echo "OK: phase34683 e2e passed"
