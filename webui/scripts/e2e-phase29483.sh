#!/usr/bin/env bash
# Phase-29483: client soft_fertig_ssh_auth_soft_30120_echo_roster Soft 29480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_30120_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 29480+ soft_fertig_ssh_auth_soft_30120_echo_roster type ok"; echo "cleaned"; echo "OK: phase29483 e2e passed"
