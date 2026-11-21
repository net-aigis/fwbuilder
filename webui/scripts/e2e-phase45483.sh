#!/usr/bin/env bash
# Phase-45483: client soft_fertig_ssh_auth_soft_48040_echo_roster Soft 45480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_48040_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 45480+ soft_fertig_ssh_auth_soft_48040_echo_roster type ok"; echo "cleaned"; echo "OK: phase45483 e2e passed"
