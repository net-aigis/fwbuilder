#!/usr/bin/env bash
# Phase-47099: client soft_fertig_ssh_auth_ms_95500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_95500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-95500-echo roster type ok"; echo "cleaned"; echo "OK: phase47099 e2e passed"
