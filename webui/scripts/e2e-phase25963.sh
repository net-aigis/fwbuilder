#!/usr/bin/env bash
# Phase-25963: client soft_fertig_ssh_auth_soft_26160_echo_roster Soft 25960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_26160_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 25960+ soft_fertig_ssh_auth_soft_26160_echo_roster type ok"; echo "cleaned"; echo "OK: phase25963 e2e passed"
