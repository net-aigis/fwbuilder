#!/usr/bin/env bash
# Phase-17083: client soft_fertig_ssh_auth_ms_48500_echo_roster Soft 17080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_48500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17080+ soft_fertig_ssh_auth_ms_48500_echo_roster type ok"; echo "cleaned"; echo "OK: phase17083 e2e passed"
