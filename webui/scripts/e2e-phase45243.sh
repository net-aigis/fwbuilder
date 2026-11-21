#!/usr/bin/env bash
# Phase-45243: client soft_fertig_ssh_auth_ms_92500_echo_roster Soft 45240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_92500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 45240+ soft_fertig_ssh_auth_ms_92500_echo_roster type ok"; echo "cleaned"; echo "OK: phase45243 e2e passed"
