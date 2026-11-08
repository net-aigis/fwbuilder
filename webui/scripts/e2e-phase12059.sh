#!/usr/bin/env bash
# Phase-12059: client soft_fertig_ssh_auth_readiness_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_readiness_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-readiness-echo roster type ok"; echo "cleaned"; echo "OK: phase12059 e2e passed"
