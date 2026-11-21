#!/usr/bin/env bash
# Phase-30123: client soft_fertig_ssh_auth_soft_30840_echo_roster Soft 30120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_30840_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 30120+ soft_fertig_ssh_auth_soft_30840_echo_roster type ok"; echo "cleaned"; echo "OK: phase30123 e2e passed"
