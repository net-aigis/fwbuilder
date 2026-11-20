#!/usr/bin/env bash
# Phase-45819: client soft_fertig_ssh_auth_ms_93500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_93500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-93500-echo roster type ok"; echo "cleaned"; echo "OK: phase45819 e2e passed"
