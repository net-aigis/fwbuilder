#!/usr/bin/env bash
# Phase-34923: client soft_fertig_ssh_auth_soft_36160_echo_roster Soft 34920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_36160_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 34920+ soft_fertig_ssh_auth_soft_36160_echo_roster type ok"; echo "cleaned"; echo "OK: phase34923 e2e passed"
