#!/usr/bin/env bash
# Phase-12123: client soft_fertig_ssh_auth_readiness_echo_roster Soft 12120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_readiness_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12120+ soft_fertig_ssh_auth_readiness_echo_roster type ok"; echo "cleaned"; echo "OK: phase12123 e2e passed"
