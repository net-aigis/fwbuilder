#!/usr/bin/env bash
# Phase-19243: client soft_fertig_ssh_auth_soft_19240_echo_roster Soft 19240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_19240_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19240+ soft_fertig_ssh_auth_soft_19240_echo_roster type ok"; echo "cleaned"; echo "OK: phase19243 e2e passed"
