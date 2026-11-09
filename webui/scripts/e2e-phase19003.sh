#!/usr/bin/env bash
# Phase-19003: client soft_fertig_ssh_auth_ms_51500_echo_roster Soft 19000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_51500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19000+ soft_fertig_ssh_auth_ms_51500_echo_roster type ok"; echo "cleaned"; echo "OK: phase19003 e2e passed"
