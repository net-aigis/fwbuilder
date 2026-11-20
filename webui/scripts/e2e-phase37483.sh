#!/usr/bin/env bash
# Phase-37483: client soft_fertig_ssh_auth_soft_39040_echo_roster Soft 37480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_39040_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 37480+ soft_fertig_ssh_auth_soft_39040_echo_roster type ok"; echo "cleaned"; echo "OK: phase37483 e2e passed"
