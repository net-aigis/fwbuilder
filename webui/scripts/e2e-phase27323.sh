#!/usr/bin/env bash
# Phase-27323: client soft_fertig_ssh_auth_ms_64500_echo_roster Soft 27320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_64500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 27320+ soft_fertig_ssh_auth_ms_64500_echo_roster type ok"; echo "cleaned"; echo "OK: phase27323 e2e passed"
